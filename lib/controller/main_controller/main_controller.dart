import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:platform_detector/model/state_model/state_model.dart';

class MainController extends GetxController {
  static const MethodChannel _platformChannel =
      MethodChannel('platform_detector/methods');
  static const MethodChannel _installedChannel =
      MethodChannel('installed_apps');

  final showSystemApps = false.obs;
  final searchQuery = ''.obs;
  final filteredApps = <AppInfo>[].obs;

  @override
  void onInit() {
    fetchApps();
    super.onInit();
  }

  CustomState state = CustomState();

  List<AppInfo>? apps;

  List<AppInfo> get currentApps => apps ?? [];

  Future<void> fetchApps() async {
    state.changeState(RequestState.loading);
    try {
      final dynamic rawApps = await _installedChannel.invokeMethod(
        'getInstalledApps',
        {
          'exclude_system_apps': !showSystemApps.value,
          'with_icon': true,
          'package_name_prefix': '',
          'platform_type': '', // let plugin detect the build type per APK
        },
      );
      apps = AppInfo.parseList(rawApps);
      _applySearch();
      state.changeState(RequestState.success);
    } catch (e) {
      state.changeState(RequestState.failure);
    }
  }

  void toggleSystemApps() {
    showSystemApps.value = !showSystemApps.value;
    fetchApps();
  }

  void updateSearch(String value) {
    searchQuery.value = value;
    _applySearch();
  }

  void _applySearch() {
    final query = searchQuery.value.trim().toLowerCase();
    if (currentApps.isEmpty) {
      filteredApps.value = [];
      return;
    }

    if (query.isEmpty) {
      filteredApps.value = List<AppInfo>.from(currentApps);
      return;
    }

    filteredApps.value = currentApps
        .where((app) =>
            app.name.toLowerCase().contains(query) ||
            app.packageName.toLowerCase().contains(query))
        .toList();
  }

  Future<bool> deleteApp({
    required String namedPackage,
  }) async {
    final result = await InstalledApps.uninstallApp(namedPackage);
    return result ?? false;
  }

  Future<bool> shareApp(String namedPackage) async {
    try {
      await _platformChannel.invokeMethod(
        'shareApk',
        {'package_name': namedPackage},
      );
      return true;
    } on PlatformException catch (e) {
      debugPrint('shareApk failed: ${e.message}');
      return false;
    } catch (e) {
      debugPrint('shareApk unexpected error: $e');
      return false;
    }
  }

  Future<void> openApp({
    required String namedPackage,
  }) async {
    AppInfo? _app =
        await InstalledApps.getAppInfo(namedPackage, BuiltWith.flutter);
    debugPrint('openApp info: $_app');
  }

  Future<void> handleShare(BuildContext context, AppInfo app) async {
    final success = await shareApp(app.packageName);
    Get.snackbar(
      'Share APK',
      success ? 'Shared via system sheet.' : 'Unable to export APK.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: success ? null : Colors.redAccent.withOpacity(0.3),
    );
  }

  Future<void> confirmUninstall(BuildContext context, AppInfo app) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${app.name}?'),
        content: const Text('This will remove the app from your device.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Uninstall'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    final success = await deleteApp(namedPackage: app.packageName);
    Get.snackbar(
      'Uninstall',
      success ? 'Uninstall flow started.' : 'Could not launch uninstall.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

}