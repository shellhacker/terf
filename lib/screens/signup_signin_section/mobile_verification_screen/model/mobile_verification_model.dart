class MobileVerificationModel {
  String? number;
  String? status;
  String? id;
  MobileVerificationModel({this.number, this.status, this.id});
  Map<String, dynamic> tojson() {
    return {
      "user_number": number,
    };
  }

  factory MobileVerificationModel.fromJson(Map<String, dynamic> json) {
    return MobileVerificationModel(id: json['_id'], status: json['status']);
  }
}

class MobileVerificationResponseModel {
  String? id;
  String? otp;
  String? status;

  MobileVerificationResponseModel({
    this.otp,
    this.id,
    this.status,
  });

  Map<String, dynamic> tojson() {
    return {
      "user_otp": otp,
    };
  }

  factory MobileVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return MobileVerificationResponseModel(
        id: json['jwt'], status: json['status']);
  }
}
