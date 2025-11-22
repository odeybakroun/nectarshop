class LoginResponseEntity {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? grnder;
  final String? image;
  final String? accessToken;
  final String? refreshToken;

  const LoginResponseEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.grnder,
    this.image,
    this.accessToken,
    this.refreshToken,
  });
}
