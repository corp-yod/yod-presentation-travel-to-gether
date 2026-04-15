class LoginResponse {
  final String userId;
  final String accessToken;
  final String refreshToken;

  LoginResponse({
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userId: json['userId'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
