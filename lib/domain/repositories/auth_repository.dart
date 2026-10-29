import 'package:flutter_application_1/domain/entities/user_entity.dart';

/// Contrato para las operaciones de autenticación en la capa de Dominio.
abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String name, String email, String password);
  Future<void> sendPasswordReset(String email);
  Future<void> logout();
}
