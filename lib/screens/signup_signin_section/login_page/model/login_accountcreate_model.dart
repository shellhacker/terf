class LoginModel {
  String? userMail;
  String? userPassword;

  LoginModel({
    required this.userMail,
    required this.userPassword,
  });

  Map<String, dynamic> tojson() {
    return {
      'user_mail': userMail,
      'user_password': userPassword,
    };
  }
}

class LoginRespoModel {
  String? message;
  bool? status;

  LoginRespoModel({
    required this.message,
    required this.status,
  });

  factory LoginRespoModel.fromJson(Map<String, dynamic> json) {
    return LoginRespoModel(message: json['message'], status: json['status']);
  }
}
