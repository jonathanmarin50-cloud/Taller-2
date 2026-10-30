import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/dashboard_page.dart';
import 'package:flutter_application_1/presentation/pages/forgot_password_page.dart';
import 'package:flutter_application_1/presentation/pages/login_page.dart';
import 'package:flutter_application_1/presentation/pages/profile_page.dart';
import 'package:flutter_application_1/presentation/pages/register_page.dart';
import 'package:flutter_application_1/presentation/pages/splash_page.dart';

/// Nombres centralizados de las rutas de la aplicación UserMaster.
abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';

  // Alias compatibles
  static const String registro = register;
  static const String recuperarContrasena = forgotPassword;
}

/// Mapa de rutas consumido por MaterialApp en `app.dart`.
Map<String, WidgetBuilder> get appRoutes => <String, WidgetBuilder>{
  AppRoutes.splash: (context) => const SplashPage(),
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.register: (context) => const RegisterPage(),
  AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
  AppRoutes.dashboard: (context) => const DashboardPage(),
  AppRoutes.profile: (context) => const ProfilePage(),
};
