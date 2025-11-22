import 'package:nectarshop/src/features/users/domain/entities/login_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/login_response_entity.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_response_entity.dart';

abstract class AuthRepo {
  Future<RegisterResponseEntity> registerUser(RegisterEntity registerEntity);
  Future<LoginResponseEntity> loginUser(LoginEntity loginEntity);
}
