import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/themes/app_theme.dart';

/// Temas específicos de la capa de presentación.
abstract final class PresentationThemes {
  static ThemeData get current => AppTheme.lightTheme;
}
