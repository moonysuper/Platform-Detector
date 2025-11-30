import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:platform_detector/controller/main_controller/main_controller.dart';
import 'package:toastification/toastification.dart';
import 'package:get/get.dart';



String platformLabel(BuiltWith builtWith) {
  switch (builtWith) {
    case BuiltWith.flutter:
      return 'Flutter';
    case BuiltWith.react_native:
      return 'React Native';
    case BuiltWith.xamarin:
      return 'Xamarin';
    case BuiltWith.ionic:
      return 'Ionic';
    case BuiltWith.native_or_others:
      return 'Native (Java/Kotlin)';
  }
}

/// Converts custom Kotlin detection string to readable label
String customPlatformLabel(String platform) {
  switch (platform.toLowerCase()) {
    case 'flutter':
      return 'Flutter';
    case 'react_native':
      return 'React Native';
    case 'xamarin':
      return 'Xamarin';
    case 'ionic':
      return 'Ionic';
    case 'unity':
      return 'Unity';
    case 'kotlin':
      return 'Native (Kotlin)';
    case 'java':
      return 'Native (Java)';
    case 'native':
      return 'Native';
    case 'unknown':
    default:
      return 'Unknown';
  }
}

void showPlatformToast(BuildContext context, AppInfo app) async {
  // Get custom detection from Kotlin
  final controller = Get.find<MainController>();
  final customPlatform = await controller.detectPlatform(app.packageName);
  
  toastification.show(
    context: context,
    title: Text('${app.name} platform'),
    description: Text(customPlatformLabel(customPlatform)),
    type: customPlatformToastType(customPlatform),
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.topRight,
  );
}

ToastificationType platformToastType(BuiltWith builtWith) {
  switch (builtWith) {
    case BuiltWith.flutter:
      return ToastificationType.custom(
        "Flutter",
        const Color(0xFF42A5F5), // Flutter Blue
        Icons.flutter_dash,
      );

    case BuiltWith.native_or_others:
      return ToastificationType.custom(
        "Native",
        const Color(0xFF4CAF50), // Green
        Icons.android, // Java/Kotlin
      );

    case BuiltWith.react_native:
      return ToastificationType.custom(
        "React Native",
        const Color(0xFF61DAFB), // React logo color
        Icons.phone_iphone,
      );

    case BuiltWith.xamarin:
      return ToastificationType.custom(
        "Xamarin",
        const Color(0xFF3498DB), // Xamarin blue
        Icons.apps,
      );

    case BuiltWith.ionic:
      return ToastificationType.custom(
        "Ionic",
        const Color(0xFF4E8EF7), // Ionic blue
        Icons.blur_circular,
      );
  }
}

/// Toast type for custom Kotlin detection results
ToastificationType customPlatformToastType(String platform) {
  switch (platform.toLowerCase()) {
    case 'flutter':
      return ToastificationType.custom(
        "Flutter",
        const Color(0xFF42A5F5), // Flutter Blue
        Icons.flutter_dash,
      );

    case 'react_native':
      return ToastificationType.custom(
        "React Native",
        const Color(0xFF61DAFB), // React logo color
        Icons.phone_iphone,
      );

    case 'xamarin':
      return ToastificationType.custom(
        "Xamarin",
        const Color(0xFF3498DB), // Xamarin blue
        Icons.apps,
      );

    case 'ionic':
      return ToastificationType.custom(
        "Ionic",
        const Color(0xFF4E8EF7), // Ionic blue
        Icons.blur_circular,
      );

    case 'unity':
      return ToastificationType.custom(
        "Unity",
        const Color(0xFF000000), // Unity black
        Icons.games,
      );

    case 'kotlin':
      return ToastificationType.custom(
        "Kotlin",
        const Color(0xFF7F52FF), // Kotlin purple
        Icons.code,
      );

    case 'java':
      return ToastificationType.custom(
        "Java",
        const Color(0xFFF89820), // Java orange
        Icons.coffee,
      );

    case 'native':
      return ToastificationType.custom(
        "Native",
        const Color(0xFF4CAF50), // Green
        Icons.android,
      );

    case 'unknown':
    default:
      return ToastificationType.custom(
        "Unknown",
        const Color(0xFF9E9E9E), // Grey
        Icons.help_outline,
      );
  }
}