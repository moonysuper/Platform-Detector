import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installed_apps/app_info.dart';
import 'package:platform_detector/controller/main_controller/main_controller.dart';
import 'package:platform_detector/model/state_model/state_model.dart';
import 'package:toastification/toastification.dart';

import '../../utilities/helper_widget/helper_widget.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Platform Detector'),
        actions: [
          Obx(
            () => PopupMenuButton<int>(
              icon: Icon(
                controller.showSystemApps.value
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onSelected: (_) => controller.toggleSystemApps(),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.showSystemApps.value
                          ? 'Hide system apps'
                          : 'Show system apps'),
                      Icon(
                        controller.showSystemApps.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onChanged: controller.updateSearch,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search installed apps',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                final state = controller.state.state.value;
                if (state == RequestState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state == RequestState.failure) {
                  return Center(
                    child: TextButton(
                      onPressed: controller.fetchApps,
                      child: const Text('Try again'),
                    ),
                  );
                }

                final apps = controller.filteredApps;
                if (apps.isEmpty) {
                  final hasInstalled = controller.apps?.isNotEmpty ?? false;
                  final message = hasInstalled
                      ? 'No apps match your search.'
                      : 'No apps detected. Tap refresh.';
                  return Center(
                    child: TextButton(
                      onPressed: controller.fetchApps,
                      child: Text(message),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemBuilder: (_, index) {
                    final app = apps[index];
                    return Card(

                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (app.icon != null && app.icon!.isNotEmpty)
                                  Image.memory(
                                    app.icon!,
                                    width: 56,
                                    height: 56,
                                    fit: BoxFit.cover,
                                  )
                                else
                                  const Icon(
                                    Icons.apps,
                                    size: 56,
                                    color: Colors.blueGrey,
                                  ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        app.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        app.packageName,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Platform: ${platformLabel(app.builtWith)} • ${app.getVersionInfo()}',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () =>
                                      showPlatformToast(context, app),
                                  child: const Text('Platform'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      controller.handleShare(context, app),
                                  child: const Text('Share APK'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      controller.confirmUninstall(context, app),
                                  child: const Text('Uninstall'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 4),
                  itemCount: apps.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
