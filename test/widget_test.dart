import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/presentation/pages/dashboard_page.dart';
import 'package:flutter_application_1/presentation/pages/forgot_password_page.dart';
import 'package:flutter_application_1/presentation/pages/login_page.dart';
import 'package:flutter_application_1/presentation/pages/profile_page.dart';
import 'package:flutter_application_1/presentation/pages/register_page.dart';
import 'package:flutter_application_1/presentation/pages/splash_page.dart';
import 'package:flutter_application_1/presentation/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('1. Muestra SplashPage 3s y navega al Login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const UserMasterApp());

    // Verifica que el Splash esté visible inicialmente
    expect(find.byType(SplashPage), findsOneWidget);
    expect(find.text('UserMaster'), findsOneWidget);

    // Avanza los 3 segundos del temporizador del splash
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Ahora debe estar en la pantalla de Login
    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Inicio de Sesión'), findsOneWidget);
  });

  testWidgets('2. Login valida campos y simula carga de 2s hacia Dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: AppRoutes.login,
        routes: appRoutes,
      ),
    );

    expect(find.byType(LoginPage), findsOneWidget);

    // Intenta ingresar sin datos
    await tester.tap(find.text('Ingresar'));
    await tester.pump();
    expect(find.text('Ingresa tu correo'), findsOneWidget);
    expect(find.text('Ingresa tu contraseña'), findsOneWidget);

    // Llena los datos válidos
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Correo electrónico'),
      'admin@usermaster.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Contraseña'),
      '123456',
    );
    await tester.tap(find.text('Ingresar'));
    await tester.pump();

    // Verifica que el indicador de carga esté visible
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Avanza los 2 segundos de la simulación
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Debe haber navegado al Dashboard
    expect(find.byType(DashboardPage), findsOneWidget);
    expect(find.text('Hola, Usuario'), findsOneWidget);
  });

  testWidgets('3. Registro valida contraseñas y permite crear cuenta', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: AppRoutes.login,
        routes: appRoutes,
      ),
    );

    // Navega a Registro
    final btnRegistro = find.text('Registrarse');
    await tester.ensureVisible(btnRegistro);
    await tester.tap(btnRegistro);
    await tester.pumpAndSettle();

    expect(find.byType(RegisterPage), findsOneWidget);

    // Completa el formulario
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Nombre completo'),
      'Carlos Gómez',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Correo electrónico'),
      'carlos@usermaster.com',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Contraseña'),
      '123456',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Confirmar contraseña'),
      'distinta',
    );

    final btnCrear = find.widgetWithText(CustomButton, 'Crear cuenta');
    await tester.ensureVisible(btnCrear);
    await tester.tap(btnCrear);
    await tester.pump();

    expect(find.text('Las contraseñas no coinciden'), findsOneWidget);

    // Corrige contraseña
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Confirmar contraseña'),
      '123456',
    );
    await tester.tap(btnCrear);
    await tester.pump();

    // Avanza simulación
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // Vuelve al login
    expect(find.byType(LoginPage), findsOneWidget);
  });

  testWidgets('4. Recuperar contraseña valida correo y muestra SnackBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: AppRoutes.login,
        routes: appRoutes,
      ),
    );

    final btnOlvidaste = find.text('¿Olvidaste tu contraseña?');
    await tester.ensureVisible(btnOlvidaste);
    await tester.tap(btnOlvidaste);
    await tester.pumpAndSettle();

    expect(find.byType(ForgotPasswordPage), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Correo electrónico'),
      'recuperar@usermaster.com',
    );

    final btnEnviar = find.text('Enviar enlace de recuperación');
    await tester.ensureVisible(btnEnviar);
    await tester.tap(btnEnviar);
    await tester.pump();

    await tester.pump(const Duration(seconds: 1));
    await tester.pump();

    expect(
      find.text('Se ha enviado un enlace de recuperación a recuperar@usermaster.com'),
      findsOneWidget,
    );
  });

  testWidgets('5. Dashboard muestra 5 cards y cambia a pestaña de Perfil', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(userEmail: 'jonathan@usermaster.com'),
      ),
    );

    expect(find.text('Hola, Usuario'), findsOneWidget);

    // Verifica que haya al menos 5 tarjetas en el ListView
    final cardsFinder = find.byType(Card, skipOffstage: false);
    expect(cardsFinder.evaluate().length, greaterThanOrEqualTo(5));

    // Cambia de pestaña a Perfil en el BottomNavigationBar
    await tester.tap(find.text('Perfil'));
    await tester.pumpAndSettle();

    expect(find.byType(ProfilePage), findsOneWidget);
    expect(find.text('jonathan@usermaster.com'), findsOneWidget);
    expect(find.text('Cerrar sesión'), findsOneWidget);
  });

  testWidgets('6. Perfil permite cerrar sesión destruyendo historial', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: AppRoutes.profile,
        routes: appRoutes,
      ),
    );

    final btnLogout = find.text('Cerrar sesión');
    await tester.ensureVisible(btnLogout);
    await tester.tap(btnLogout);
    await tester.pumpAndSettle();

    // Cuadro de diálogo de confirmación
    expect(find.text('Confirmar salida'), findsOneWidget);
    expect(find.text('¿Estás seguro de que deseas salir de tu cuenta?'), findsOneWidget);

    // Presiona Salir
    await tester.tap(find.text('Salir'));
    await tester.pumpAndSettle();

    // Debe regresar a Login
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
