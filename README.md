# UserMaster - App Base con Clean Architecture

## 📖 Descripción

**UserMaster** es una aplicación móvil y web desarrollada en **Flutter** siguiendo las mejores prácticas y principios de **Clean Architecture**. La aplicación cuenta con un diseño moderno y responsivo basado en **Material 3**, validaciones reactivas en tiempo real, gestión modular de rutas y un pipeline automatizado de integración y despliegue continuo (**CI/CD**) hacia **GitHub Pages**.

---

## 🎯 Objetivos

- **Arquitectura Limpia (Clean Architecture):** Separar las responsabilidades de la aplicación en capas independientes desacopladas (`core`, `data`, `domain` y `presentation`).
- **Flujo Integral de Autenticación y Navegación:** Implementar pantallas funcionales para Splash, Inicio de Sesión, Registro de Usuario, Recuperación de Contraseña, Dashboard y Perfil.
- **Componentes Reutilizables:** Diseñar y abstraer widgets comunes (`CustomButton`, `CustomTextField`, `AuthCard`) para evitar la duplicación de código y garantizar consistencia visual.
- **Centralización de Estilos y Rutas:** Estandarizar la paleta de colores en `app_colors.dart`, el tema global en `app_theme.dart` y el mapa de navegación en `app_routes.dart`.
- **Aseguramiento de la Calidad (Testing):** Validar la lógica de negocio y componentes mediante una suite completa de pruebas unitarias y de widgets.
- **Automatización CI/CD:** Desplegar automáticamente la versión web de la aplicación en GitHub Pages tras cada actualización en la rama principal.

---

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/) (SDK ^3.13.5)
- **Lenguaje:** [Dart](https://dart.dev/)
- **Diseño de Interfaz:** Material Design 3 con diseño responsivo (Móvil y Web)
- **Patrón de Arquitectura:** Clean Architecture
- **Control de Versiones:** Git & GitHub
- **Integración y Despliegue Continuo (CI/CD):** GitHub Actions
- **Hosting / Deploy Web:** GitHub Pages
- **Testing:** `flutter_test` (pruebas unitarias, modelos, casos de uso y widgets)

---

## 🏛️ Estructura del Proyecto (Clean Architecture)

```text
flutter_application_1/
│
├── .github/
│   └── workflows/
│       └── deploy.yml            # Pipeline de CI/CD para GitHub Pages
│
├── assets/                       # Recursos estáticos e imágenes de fondo
│   ├── bg_fresh.jpg
│   └── wallhaven-d8vvlo_600x600 (1).png
│
├── lib/
│   ├── core/                     # Lógica transversal y recursos compartidos
│   │   ├── constants/            # Colores (app_colors.dart), assets (app_assets.dart)
│   │   ├── errors/               # Manejo centralizado de fallos (failures.dart)
│   │   ├── network/              # Verificación de conectividad (network_info.dart)
│   │   ├── themes/               # Configuración de temas Material 3 (app_theme.dart)
│   │   ├── utils/                # Validadores de formularios (validators.dart)
│   │   └── widgets/              # Widgets reutilizables (CustomButton, CustomTextField)
│   │
│   ├── data/                     # Capa de datos (modelos, mappers y fuentes)
│   │   ├── datasources/          # Fuentes de datos remotas/locales
│   │   ├── mappers/              # Transformadores DTO <-> Entidad
│   │   ├── models/               # UserModel (DTO con soporte JSON)
│   │   └── repositories/         # AuthRepositoryImpl con simulación de latencia
│   │
│   ├── domain/                   # Capa de dominio (reglas de negocio puras)
│   │   ├── entities/             # UserEntity
│   │   ├── exceptions/           # Excepciones de negocio
│   │   ├── repositories/         # Contratos e interfaces (AuthRepository)
│   │   └── usecases/             # LoginUseCase
│   │
│   ├── presentation/             # Capa de presentación (UI, estado y navegación)
│   │   ├── blocs/                # Estados de autenticación (auth_state.dart)
│   │   ├── pages/                # splash_page, login_page, register_page,
│   │   │                         # forgot_password_page, dashboard_page, profile_page
│   │   ├── routes/               # Centralización de navegación (app_routes.dart)
│   │   ├── themes/               # Estilos específicos de presentación
│   │   └── widgets/              # Tarjetas y decoradores de autenticación
│   │
│   ├── app.dart                  # Configuración principal de MaterialApp
│   └── main.dart                 # Punto de entrada de la aplicación
│
├── test/                         # Suite de pruebas automatizadas
│   ├── data/models/              # Pruebas de modelos de datos
│   ├── domain/usecases/          # Pruebas de casos de uso
│   ├── presentation/widgets/     # Pruebas de widgets aislados
│   └── widget_test.dart          # Pruebas de integración de la UI y navegación
│
└── pubspec.yaml                  # Dependencias y configuración de Flutter
```

---

## 📱 Pantallas y Flujos Implementados

1. **Splash Screen (`splash_page.dart`):**
   - Muestra el isotipo y nombre de *UserMaster* centrado sobre el color principal del tema (`AppColors.primary`).
   - Duración de **3 segundos** con redirección automática a la pantalla de Inicio de Sesión.

2. **Inicio de Sesión (`login_page.dart`):**
   - Campos para **Correo electrónico** y **Contraseña** con validaciones reactivas.
   - Botón *"Ingresar"* con estado de carga (`CircularProgressIndicator`) simulando latencia por **2 segundos** y redirección al Dashboard.
   - Enlaces para navegar a *"Registrarse"* y *"¿Olvidaste tu contraseña?"*.

3. **Registro de Usuario (`register_page.dart`):**
   - Formulario con campos: **Nombre completo**, **Correo electrónico**, **Contraseña** y **Confirmar contraseña**.
   - Validación de coincidencia de contraseñas y retorno al Login con confirmación mediante `SnackBar`.

4. **Recuperación de Contraseña (`forgot_password_page.dart`):**
   - Campo para ingresar el correo electrónico registrado.
   - Botón *"Enviar enlace de recuperación"* con confirmación visual mediante `SnackBar` y estado de éxito con opción de reenvío.

5. **Dashboard Principal (`dashboard_page.dart`):**
   - Navegación inferior con `BottomNavigationBar` con dos pestañas: **Inicio** y **Perfil**.
   - Pestaña **Inicio**: Mensaje de bienvenida personalizado (*"Hola, Usuario"*), tarjeta destacada de resumen y `ListView` con tarjetas de tareas y notificaciones recientes.

6. **Perfil de Usuario (`profile_page.dart`):**
   - Avatar de usuario, nombre, correo y detalles de la cuenta.
   - Botón destacado en color rojo (*"Cerrar sesión"*) que destruye el stack de navegación (`pushNamedAndRemoveUntil`) y regresa al Login.

---

## 🧩 Widgets Reutilizables

Para evitar código duplicado y promover el principio DRY, se extrajeron componentes base en `lib/core/widgets/`:
- `CustomButton`: Botón principal adaptable con soporte nativo de indicador de carga (`isLoading`), personalización de color, icono y ancho completo.
- `CustomTextField`: Campo de entrada de texto estandarizado con soporte para visibilidad de contraseña, validadores, iconos y capitalización.
- `AuthCard`: Contenedor responsivo con bordes redondeados y sombra para los formularios de autenticación.

---

## 🧪 Pruebas Automatizadas

Para validar el correcto funcionamiento de los componentes y casos de uso:

```bash
flutter analyze
flutter test
```

---

## 🚀 Despliegue Automático con GitHub Pages (CI/CD)

El archivo [.github/workflows/deploy.yml](.github/workflows/deploy.yml) compila y publica automáticamente la aplicación web cada vez que se envía un commit a la rama `main` o `master`:

1. Se clona el repositorio y se configura el SDK de Flutter.
2. Se instalan dependencias y se ejecutan las pruebas automatizadas (`flutter test`).
3. Se compila la versión web de producción (`flutter build web --release`).
4. Se publica automáticamente en la rama `gh-pages` servida por **GitHub Pages**.

---

## 👤 Autor

- **Nombre:** Jonathan Marín
- **Correo Electrónico:** [jonathanmarin50@gmail.com](mailto:jonathanmarin50@gmail.com)
- **Taller:** Taller 2 - Flutter & Clean Architecture
