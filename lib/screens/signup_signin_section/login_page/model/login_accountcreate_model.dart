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

class GetAllTimeSlot {
  String? message;
  bool? status;
  String? token;
  String? refreshToken;
  String? id;

  GetAllTimeSlot(
      {required this.message,
      required this.status,
      this.token,
      this.refreshToken,
      this.id});

  factory GetAllTimeSlot.fromJson(Map<String, dynamic> json) {
    return GetAllTimeSlot(
        message: json['message'],
        status: json['status'],
        token: json['token'],
        refreshToken: json['refreshToken'],
        id: json['_id']);
  }
}
