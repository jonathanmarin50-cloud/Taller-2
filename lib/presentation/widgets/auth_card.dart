import 'package:flutter/material.dart';

/// Contenedor de tarjeta específico para la capa de presentación.
class AuthCard extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const AuthCard({
    super.key,
    required this.child,
    this.maxWidth = 430,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 36,
          ),
          child: child,
        ),
      ),
    );
  }
}
