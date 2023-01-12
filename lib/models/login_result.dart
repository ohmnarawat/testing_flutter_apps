class LoginResult {
  final String status;
  final String? message;

  LoginResult({
    required this.status,
    this.message,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      status: json['status'],
      message: json['message'],
    );
  }
}
