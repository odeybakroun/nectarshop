import 'package:nectarshop/src/core/api/client/dio_client.dart';
import 'package:nectarshop/src/features/users/data/models/login_model.dart';
import 'package:nectarshop/src/features/users/data/models/register_model.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource(this.dioClient);

Future<Map<String, dynamic>> registerUser(RegisterModel register) async {
  try {
    final response = await dioClient.post<Map<String, dynamic>>(
      '/users/add',
      data: register.tojson(),
    );

    if (response.statusCode == 201) {
      return response.data!; 
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    rethrow;
  }
}




Future<Map<String, dynamic>> loginUser(LoginModel login) async {
  try {
    final response = await dioClient.post<Map<String, dynamic>>(
      '/auth/login',
      data: login.tojson(),
    );

    if (response.statusCode == 200) {
      return response.data!; 
    } else {
      throw Exception('Failed to login user');
    }
  } catch (e) {
    rethrow;
  }
}
 
}
