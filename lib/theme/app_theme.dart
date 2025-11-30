import 'package:flutter/material.dart';

class AppTheme {
  static const _bg = Color(0xFF050014);
  static const _surface = Color(0xFF0B0720);
  static const _primary = Color(0xFFFF2ED1); // magenta
  static const _secondary = Color(0xFF2EF2FF); // cyan
  static const _accent = Color(0xFFFFE45C); // yellow
  static const _textPrimary = Color(0xFFF5F5FF);
  static const _textSecondary = Color(0xFFB0A8D9);
  static const _error = Color(0xFFFF4C4C);

  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: _surface,
      primary: _primary,
      secondary: _secondary,
      error: _error,
      onPrimary: _bg,
      onSecondary: _bg,
      onSurface: _textPrimary,
      onError: _bg,
    ),
    scaffoldBackgroundColor: _bg,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: _textPrimary, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(color: _textPrimary, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: _textPrimary, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(color: _textPrimary, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(color: _textSecondary),
      bodyMedium: TextStyle(color: _textSecondary),
      labelLarge: TextStyle(color: _textPrimary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _bg,
      foregroundColor: _textPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    cardColor: _surface,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _secondary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _error),
      ),
      labelStyle: const TextStyle(color: _textSecondary),
      hintStyle: const TextStyle(color: _textSecondary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        foregroundColor: _bg,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: _secondary),
        foregroundColor: _secondary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    chipTheme: const ChipThemeData(
      backgroundColor: _surface,
      labelStyle: TextStyle(color: _accent),
      side: BorderSide(color: _secondary),
    ),
  );
}
