import 'package:flutter_application_1/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LoginUseCase debe autenticar y retornar UserEntity', () async {
    final repository = AuthRepositoryImpl();
    final useCase = LoginUseCase(repository);

    final user = await useCase.execute('test@usermaster.com', '123456');

    expect(user.id, isNotEmpty);
    expect(user.email, 'test@usermaster.com');
  });
}
