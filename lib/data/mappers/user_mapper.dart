import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_application_1/domain/entities/user_entity.dart';

/// Mapeador entre UserModel (DTO) y UserEntity (Dominio).
abstract final class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}
