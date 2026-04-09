class LoginResponse {
  final String access_token;
  final String refresh_token;

  LoginResponse({required this.access_token, required this.refresh_token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
  }
}
