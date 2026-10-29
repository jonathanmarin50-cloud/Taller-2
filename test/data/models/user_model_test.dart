import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UserModel debe serializar y deserializar JSON correctamente', () {
    final json = {
      'id': 'usr_123',
      'name': 'Jonathan',
      'email': 'jonathan@usermaster.com',
    };

    final model = UserModel.fromJson(json);

    expect(model.id, 'usr_123');
    expect(model.name, 'Jonathan');
    expect(model.email, 'jonathan@usermaster.com');
    expect(model.toJson(), json);
  });
}
