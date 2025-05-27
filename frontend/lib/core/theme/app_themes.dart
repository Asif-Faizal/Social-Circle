import 'package:flutter/material.dart';

class AppThemes {
  // Primary color
  static const Color primaryColor = Color(0xFFFF641A);
  static const Color primaryLightColor = Color(0xFFFFE0D1);
  static const Color secondaryColor = Color(0xFF424242);
  
  // Text colors
  static const Color textDarkColor = Color(0xFF212121);
  static const Color textMediumColor = Color(0xFF666666);
  static const Color textLightColor = Color(0xFF9E9E9E);
  
  // Other colors
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color errorColor = Color(0xFFE53935);
  static const Color successColor = Color(0xFF43A047);
  
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      surface: backgroundColor,
    ),
    
    // Progress indicator theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: primaryLightColor,
    ),
    
    // Font configuration
    fontFamily: 'Inter',
    
    // AppBar theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: textDarkColor,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      iconTheme: const IconThemeData(
        color: primaryColor,
        size: 24.0,
      ),
    ),
    
    // Icon theme
    iconTheme: const IconThemeData(
      color: primaryColor,
      size: 24.0,
    ),
    
    // ListTile theme
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      dense: false,
      tileColor: Colors.transparent,
      horizontalTitleGap: 16.0,
      minLeadingWidth: 24.0,
      iconColor: primaryColor,
      textColor: textDarkColor,
    ),
    
    // Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2.0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2.0,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: primaryColor,
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: primaryColor),
      ),
    ),
    
    // Icon Button theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    
    // Card theme
    cardTheme: CardTheme(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),
    
    // Text theme
    textTheme: const TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      
      // Title styles
      titleLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: textDarkColor,
      ),
      
      // Body styles
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: textDarkColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: textDarkColor,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: textMediumColor,
      ),
      
      // Label styles
      labelLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
    ),
    
    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorColor),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        color: textMediumColor,
      ),
      hintStyle: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14.0,
        color: Colors.grey.shade400,
      ),
    ),
  );
}
