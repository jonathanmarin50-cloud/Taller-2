import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_assets.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/presentation/routes/app_routes.dart';

/// Pantalla de Perfil de Usuario.
/// Muestra avatar genérico, nombre, correo y botón rojo de Cerrar Sesión.
class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final bool showAppBar;

  const ProfilePage({
    super.key,
    this.userName = 'Usuario UserMaster',
    this.userEmail = 'usuario@usermaster.com',
    this.showAppBar = true,
  });

  void _cerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirmar salida'),
        content: const Text('¿Estás seguro de que deseas salir de tu cuenta?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              // Destruye el historial de navegación y devuelve al usuario al Login
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            },
            child: const Text('Salir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: AppColors.primaryContainer,
                    child: const Icon(
                      Icons.person_rounded,
                      size: 64,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    userEmail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 12),
                  const ListTile(
                    leading: Icon(Icons.badge_outlined, color: AppColors.primary),
                    title: Text('Rol de Usuario'),
                    subtitle: Text('Administrador'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const ListTile(
                    leading: Icon(Icons.security_outlined, color: AppColors.primary),
                    title: Text('Estado de Cuenta'),
                    subtitle: Text('Activa y Verificada'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 24),
                  // Botón rojo de Cerrar Sesión que destruye el historial
                  CustomButton(
                    text: 'Cerrar sesión',
                    icon: Icons.logout_rounded,
                    backgroundColor: AppColors.error,
                    textColor: Colors.white,
                    onPressed: () => _cerrarSesion(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (showAppBar) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Perfil de Usuario'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AppAssets.freshBackground,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.white.withValues(alpha: 0.20),
              ),
            ),
            SafeArea(child: content),
          ],
        ),
      );
    }

    return content;
  }
}
