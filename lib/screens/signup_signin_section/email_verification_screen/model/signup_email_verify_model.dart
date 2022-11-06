class SignupEmailVerifyModel {
  String? userOtp;
  String? id;
  bool? status;
  String? message;
  String? token;
  String? refreshToken;
  SignupEmailVerifyModel(
      {this.userOtp,
      this.id,
      this.status,
      this.message,
      this.token,
      this.refreshToken});

  factory SignupEmailVerifyModel.fromJson(Map<String, dynamic> json) {
    return SignupEmailVerifyModel(
        status: json['status'],
        message: json['message'],
        token: json['token'],
        refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> tojson() {
    return {"user_otp": userOtp, "_id": id};
  }
}
