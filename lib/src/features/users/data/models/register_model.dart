import 'dart:convert';

import 'package:nectarshop/src/features/users/domain/entities/register_entities.dart';
import 'package:nectarshop/src/features/users/domain/entities/register_response_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.email,
    required super.password,
    required super.firstname,
    required super.lastname,
    required super.age,
  });

  /// تحويل من JSON إلى Model
  factory RegisterModel.fromjson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'] ?? "",
      firstname: json['firstName'] ?? "",
      lastname: json['lastName'] ?? "",
      age: json['age'] ?? 0,
    );
  }

  /// تحويل من Model إلى JSON
  Map<String, dynamic> tojson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstname,
      'lastName': lastname,
      'age': age,
    };
  }

        static  RegisterResponseEntity   toRegisterResponse(Map<String, dynamic> json) {
    return RegisterResponseEntity(
      id: json['id'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      age: json['age'],
      );
  }

  /// تحويل JSON String إلى Model
  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromjson(json.decode(source));

  /// تحويل Model إلى JSON String
  String toJson() => json.encode(tojson());
}
