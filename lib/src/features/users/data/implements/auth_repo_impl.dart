import 'package:nectarshop/src/features/users/data/models/login_model.dart';
import 'package:nectarshop/src/features/users/data/models/register_model.dart';
import 'package:nectarshop/src/features/users/domain/entities/login_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/login_response_entity.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_entities.dart';

import 'package:nectarshop/src/features/users/domain/entities/register_response_entity.dart';

import '../sources/sources.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepositoryImp implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<RegisterResponseEntity> registerUser(
    RegisterEntity registerEntity,
  ) async {
    try {
      final registerResponse = await remoteDataSource.registerUser(
        RegisterModel(
          email: registerEntity.email,
          password: registerEntity.password,
          firstname: registerEntity.firstname,
          lastname: registerEntity.lastname,
          age: registerEntity.age,
        ),
      );
      return RegisterModel.toRegisterResponse(
        registerResponse as Map<String, dynamic>,
      );
    } catch (e) {
      print("$e");
      rethrow;
    }
  }

  @override
  Future<LoginResponseEntity> loginUser(LoginEntity loginEntity) async{

  try {
      final loginResponse = await remoteDataSource.loginUser(
        LoginModel(
          email: loginEntity.email,
          password: loginEntity.password,
        
        ),
      );
      return LoginModel.toLoginResponse(
        loginResponse as Map<String, dynamic>,
      );
    } catch (e) {
      print("$e");
      rethrow;
    }


   }
}
