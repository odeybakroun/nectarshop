import 'package:nectarshop/src/features/users/domain/entities/login_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/login_response_entity.dart';
import 'package:nectarshop/src/features/users/domain/repositories/auth_repo.dart';

class LoginUsecase {
  final AuthRepo authRepo;
  LoginUsecase(this.authRepo);

  Future<LoginResponseEntity> call(LoginEntity loginEntity) {
    return authRepo.loginUser(loginEntity);
  }
}
