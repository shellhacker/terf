class SignUpModel {
  String userMail;
  String userPassword;

  SignUpModel({
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

class SignUpRespoModel {
  String id;
  bool status;

  SignUpRespoModel({
    required this.id,
    required this.status,
  });

  factory SignUpRespoModel.fromJson(Map<String, dynamic> json) {
    return SignUpRespoModel(id: json['id'], status: json['status']);
  }
}
