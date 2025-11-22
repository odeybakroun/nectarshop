 
import 'dart:convert';

import 'package:nectarshop/src/features/users/domain/entities/login_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/login_response_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.email,
    required super.password,
   
  });

  /// تحويل من JSON إلى Model
  factory LoginModel.fromjson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['username'],
      password: json['password'] ?? "",
      
    );
  }

  /// تحويل من Model إلى JSON
  Map<String, dynamic> tojson() {
    return {
      'username': email,
      'password': password,
    
    };
  }

        static LoginResponseEntity   toLoginResponse(Map<String, dynamic> json) {
    return LoginResponseEntity(
     id: json['id'],
    username:json['username'],
    email:json['email'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    grnder:json['grnder'],
    image:json['image'],
    accessToken:json['accessToken'],
    refreshToken:json['refreshToken'],

      
      );
  }

  /// تحويل JSON String إلى Model
  factory LoginModel.fromJson(String source) =>
      LoginModel.fromjson(json.decode(source));

  /// تحويل Model إلى JSON String
  String toJson() => json.encode(tojson());
}
