/// Utilidades y validadores para formularios y cadenas de texto.
abstract final class Validators {
  static bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }
}
