import 'package:flutter_application_1/data/models/user_model.dart';

/// Fuente de datos remota para autenticación.
abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return UserModel(
      id: 'usr_001',
      name: email.split('@').first.toUpperCase(),
      email: email,
    );
  }
}
