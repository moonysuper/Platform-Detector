import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:toastification/toastification.dart';



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

void showPlatformToast(BuildContext context, AppInfo app) {
  toastification.show(
    context: context,
    title: const Text('Platform Info'),
    description: Text(platformLabel(app.builtWith)),
    type: platformToastType(app.builtWith),
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