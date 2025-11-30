import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  // Premium Light Theme - Clean & Sophisticated
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF8F9FC),

    colorScheme: const ColorScheme.light(
      primary: Colors.orange, // Vibrant Blue-Purple
      primaryContainer: Color(0xFFE8E9FE),
      secondary: Color(0xFF00C9A7), // Teal accent
      secondaryContainer: Color(0xFFD4FFF5),
      tertiary: Color(0xFFFF6B9D), // Pink accent
      tertiaryContainer: Color(0xFFFFE5ED),
      surface: Colors.white,
      surfaceContainerHighest: Color(0xFFF0F2F5),
      surfaceContainer: Color(0xFFFAFBFC),
      onSurface: Color(0xFF1C1E21),
      onSurfaceVariant: Color(0xFF5F6368),
      background: Color(0xFFF8F9FC),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: Color(0xFFFF3B30),
      onError: Colors.white,
      outline: Color(0xFFE4E6EB),
      shadow: Color(0x0A000000),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Color(0xFF1C1E21),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1C1E21),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF1C1E21),
        size: 24,
      ),
    ),

    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      color: Colors.white,
      shadowColor: const Color(0x08000000),
      surfaceTintColor: Colors.transparent,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:  Colors.orange,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 6,
      highlightElevation: 10,
      iconSize: 24,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: const Color(0x405B5FEE),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor:  Colors.orange,
        side: const BorderSide(color: Color(0xFFE8E9FE), width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor:  Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1C1E21),
        letterSpacing: -1.2,
        height: 1.1,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1C1E21),
        letterSpacing: -0.8,
        height: 1.15,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1C1E21),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1E21),
        letterSpacing: -0.3,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1E21),
        letterSpacing: 0,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1E21),
        letterSpacing: 0.1,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: Color(0xFF3C4043),
        letterSpacing: 0.2,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: Color(0xFF5F6368),
        letterSpacing: 0.2,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: Color(0xFF80868B),
        letterSpacing: 0.2,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.orange,
        letterSpacing: 0.3,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF5F6368),
        letterSpacing: 0.4,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF8F9FC),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE4E6EB), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE4E6EB), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.orange, width: 2.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFFF3B30), width: 2.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      hintStyle: const TextStyle(
        color: Color(0xFF9AA0A6),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: Color(0xFF5F6368),
      suffixIconColor: Color(0xFF5F6368),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFFE4E6EB),
      thickness: 1,
      space: 16,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFFE8E9FE),
      deleteIconColor:  Colors.orange,
      labelStyle: const TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: BorderSide.none,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Color(0xFF9AA0A6),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    iconTheme: const IconThemeData(
      color: Color(0xFF5F6368),
      size: 24,
    ),
  );

  // Premium Dark Theme - Sleek & Immersive
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),

    colorScheme: const ColorScheme.dark(
      primary: Colors.orange, // Lighter vibrant blue-purple
      primaryContainer: Color(0xFF2B2D5C),
      secondary: Color(0xFF00E5BE), // Bright teal
      secondaryContainer: Color(0xFF003D33),
      tertiary: Color(0xFFFF8AB3), // Soft pink
      tertiaryContainer: Color(0xFF5C1F36),
      surface: Color(0xFF1A1A1A),
      surfaceContainerHighest: Color(0xFF2D2D2D),
      surfaceContainer: Color(0xFF141414),
      onSurface: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFFB8B8B8),
      background: Color(0xFF000000),
      onPrimary: Color(0xFF000000),
      onSecondary: Color(0xFF000000),
      error: Color(0xFFFF5252),
      onError: Color(0xFF000000),
      outline: Color(0xFF3A3A3A),
      shadow: Color(0x40000000),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFF1A1A1A),
      surfaceTintColor: Colors.transparent,
      foregroundColor: Color(0xFFFFFFFF),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFFFFFF),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
        size: 24,
      ),
    ),

    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xFF2D2D2D),
          width: 1,
        ),
      ),
      elevation: 0,
      color: const Color(0xFF1A1A1A),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:  Colors.orange,
      foregroundColor: const Color(0xFF000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 8,
      highlightElevation: 12,
      iconSize: 24,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:  Colors.orange,
        foregroundColor: const Color(0xFF000000),
        elevation: 0,
        shadowColor: const Color(0x607C7FFF),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor:  Colors.orange,
        side: const BorderSide(color: Color(0xFF2B2D5C), width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor:  Colors.orange,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: Color(0xFFFFFFFF),
        letterSpacing: -1.2,
        height: 1.1,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFFFFFF),
        letterSpacing: -0.8,
        height: 1.15,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFFFFFFFF),
        letterSpacing: -0.5,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
        letterSpacing: -0.3,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
        letterSpacing: 0,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFFFFFF),
        letterSpacing: 0.1,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: Color(0xFFE0E0E0),
        letterSpacing: 0.2,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: Color(0xFFB8B8B8),
        letterSpacing: 0.2,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: Color(0xFF8A8A8A),
        letterSpacing: 0.2,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.orange,
        letterSpacing: 0.3,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFFB8B8B8),
        letterSpacing: 0.4,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1A1A1A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF3A3A3A), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF3A3A3A), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.orange, width: 2.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFFF5252), width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFFF5252), width: 2.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      hintStyle: const TextStyle(
        color: Color(0xFF6B6B6B),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: Color(0xFFB8B8B8),
      suffixIconColor: Color(0xFFB8B8B8),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFF3A3A3A),
      thickness: 1,
      space: 16,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: const Color(0xFF2B2D5C),
      deleteIconColor:  Colors.orange,
      labelStyle: const TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: BorderSide.none,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1A1A1A),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Color(0xFF6B6B6B),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    iconTheme: const IconThemeData(
      color: Color(0xFFB8B8B8),
      size: 24,
    ),
  );
}