import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_assets.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/presentation/pages/profile_page.dart';

/// Pantalla Principal (Dashboard).
/// Incluye BottomNavigationBar con pestañas 'Inicio' y 'Perfil'.
/// 'Inicio' muestra "Hola, Usuario" y un ListView con al menos 5 tarjetas recientes.
class DashboardPage extends StatefulWidget {
  final String? userEmail;

  const DashboardPage({super.key, this.userEmail});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Lista simulada de elementos recientes (notificaciones / tareas)
  final List<Map<String, dynamic>> _elementosRecientes = const [
    {
      'titulo': 'Actualizar credenciales de seguridad',
      'descripcion': 'Se recomienda renovar la contraseña cada 90 días.',
      'categoria': 'Seguridad',
      'icono': Icons.security_rounded,
      'color': Colors.amber,
      'fecha': 'Hace 10 min',
    },
    {
      'titulo': 'Nuevo inicio de sesión detectado',
      'descripcion': 'Acceso exitoso desde Chrome en Windows.',
      'categoria': 'Notificación',
      'icono': Icons.devices_rounded,
      'color': Colors.blue,
      'fecha': 'Hace 1 hora',
    },
    {
      'titulo': 'Revisar permisos de nuevos usuarios',
      'descripcion': '3 solicitudes de acceso pendientes de aprobación.',
      'categoria': 'Gestión',
      'icono': Icons.people_outline_rounded,
      'color': Colors.purple,
      'fecha': 'Hace 3 horas',
    },
    {
      'titulo': 'Copia de seguridad completada',
      'descripcion': 'El respaldo de datos se ejecutó correctamente.',
      'categoria': 'Sistema',
      'icono': Icons.cloud_done_rounded,
      'color': Colors.green,
      'fecha': 'Ayer',
    },
    {
      'titulo': 'Activar autenticación de dos factores (2FA)',
      'descripcion': 'Aumenta la protección de tu cuenta UserMaster.',
      'categoria': 'Seguridad',
      'icono': Icons.phonelink_lock_rounded,
      'color': Colors.deepOrange,
      'fecha': 'Hace 2 días',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final email = widget.userEmail ??
        ModalRoute.of(context)?.settings.arguments as String? ??
        'usuario@usermaster.com';

    final userName = email.contains('@')
        ? email.split('@').first
        : 'Usuario';

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'UserMaster Dashboard' : 'Mi Perfil'),
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SafeArea(
        child: _currentIndex == 0
            ? _buildHomeTab(userName)
            : ProfilePage(
                userName: userName[0].toUpperCase() + userName.substring(1),
                userEmail: email,
                showAppBar: false,
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab(String userName) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            // Saludo y bienvenida con tarjeta Hero con imagen de fondo fresca
            Card(
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.25),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.freshBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withValues(alpha: 0.55),
                            Colors.black.withValues(alpha: 0.22),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 22,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white.withValues(alpha: 0.25),
                          child: const Icon(
                            Icons.waving_hand_rounded,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hola, Usuario',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Bienvenido de vuelta a UserMaster ($userName)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withValues(alpha: 0.95),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Elementos Recientes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_elementosRecientes.length} tareas',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // ListView con al menos 5 tarjetas (Cards)
            ..._elementosRecientes.map(
              (item) => Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor:
                        (item['color'] as Color).withValues(alpha: 0.15),
                    child: Icon(
                      item['icono'] as IconData,
                      color: item['color'] as Color,
                    ),
                  ),
                  title: Text(
                    item['titulo'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      item['descripcion'] as String,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  trailing: Text(
                    item['fecha'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
