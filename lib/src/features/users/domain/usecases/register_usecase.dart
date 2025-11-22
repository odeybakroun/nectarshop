 
    import 'package:nectarshop/src/features/users/domain/entities/register_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_response_entity.dart';

import '../repositories/auth_repo.dart';

    class RegisterUsecase {
      final AuthRepo authRepo;

  RegisterUsecase(this.authRepo);
       
  Future<RegisterResponseEntity> call(RegisterEntity registerEntity) {
    return authRepo.registerUser(registerEntity);
  }
      }
      