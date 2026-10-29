import 'package:flutter_application_1/domain/entities/user_entity.dart';
import 'package:flutter_application_1/domain/repositories/auth_repository.dart';

/// Caso de uso para el inicio de sesión.
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) {
    return repository.login(email, password);
  }
}
