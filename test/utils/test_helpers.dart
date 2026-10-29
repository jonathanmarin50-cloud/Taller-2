import 'package:flutter/material.dart';

/// Utilidades compartidas para pruebas de widgets.
Widget createTestableWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}
