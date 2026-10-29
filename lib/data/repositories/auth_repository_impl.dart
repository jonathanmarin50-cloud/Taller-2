import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_application_1/domain/entities/user_entity.dart';
import 'package:flutter_application_1/domain/repositories/auth_repository.dart';

/// Implementación simulada del repositorio de autenticación usando Future.delayed.
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      id: 'usr_001',
      name: email.split('@').first.toUpperCase(),
      email: email,
    );
  }

  @override
  Future<UserEntity> register(
    String name,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'usr_002',
      name: name,
      email: email,
    );
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    await Future.delayed(const Duration(milliseconds: 800));
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
