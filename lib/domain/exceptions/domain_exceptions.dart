/// Excepciones propias de la capa de Dominio.
class AuthException implements Exception {
  final String message;
  const AuthException([this.message = 'Error de autenticación en el dominio']);

  @override
  String toString() => 'AuthException: $message';
}

class ValidationException implements Exception {
  final String message;
  const ValidationException([this.message = 'Error de validación de datos']);

  @override
  String toString() => 'ValidationException: $message';
}
