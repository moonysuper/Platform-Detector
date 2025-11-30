import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_detector/utilities/routes/routes.dart';
import 'package:platform_detector/utilities/themes/themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Detector',
      debugShowCheckedModeBanner: false,
      getPages: routes,
      // translations: MyLocale(),
      // locale: language == true ?  const Locale("en") : const Locale("ar"),
      // fallbackLocale: const Locale("en"),
      // theme: Themes.lightTheme,
      // darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
    );
  }
}






