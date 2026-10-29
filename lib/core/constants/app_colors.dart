import 'package:flutter/material.dart';

/// Paleta de colores centralizada para la aplicación UserMaster.
abstract final class AppColors {
  // Colores principales
  static const Color primary = Color(0xFF6750A4);
  static const Color primaryContainer = Color(0xFFEADDFF);
  static const Color onPrimary = Colors.white;
  static const Color onPrimaryContainer = Color(0xFF21005D);

  // Colores secundarios / acentos
  static const Color secondary = Color(0xFF625B71);
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  static const Color onSecondary = Colors.white;

  // Fondos y superficies
  static const Color background = Color(0xFFF7F8FC);
  static const Color surface = Colors.white;
  static const Color cardBackground = Colors.white;

  // Textos y variantes
  static const Color textPrimary = Color(0xFF1D1B20);
  static const Color textSecondary = Color(0xFF49454F);
  static const Color border = Color(0xFFCAC4D0);

  // Estados
  static const Color error = Color(0xFFB3261E);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color info = Color(0xFF0288D1);
}
