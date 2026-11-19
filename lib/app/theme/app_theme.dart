import 'package:flutter/material.dart';

abstract final class AppColors {
  static const ink = Color(0xFF17212B);
  static const muted = Color(0xFF697586);
  static const canvas = Color(0xFFF7F8FA);
  static const surface = Color(0xFFFFFFFF);
  static const border = Color(0xFFE7EAF0);
  static const primary = Color(0xFF3859D7);
  static const success = Color(0xFF16845B);
  static const warning = Color(0xFFB7791F);
}

abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isLight = brightness == Brightness.light;
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      surface: isLight ? AppColors.surface : const Color(0xFF171B22),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isLight ? AppColors.canvas : const Color(0xFF101318),
      dividerColor: isLight ? AppColors.border : const Color(0xFF2A303A),
      textTheme: ThemeData(brightness: brightness).textTheme.apply(
            bodyColor: isLight ? AppColors.ink : const Color(0xFFE8ECF2),
            displayColor: isLight ? AppColors.ink : const Color(0xFFE8ECF2),
            fontFamily: 'Inter',
          ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.ink,
      ),
      cardTheme: CardTheme(
        color: isLight ? AppColors.surface : const Color(0xFF171B22),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isLight ? AppColors.border : const Color(0xFF2A303A),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
