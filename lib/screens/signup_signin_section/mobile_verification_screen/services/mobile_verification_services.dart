import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:terf/screens/signup_signin_section/mobile_verification_screen/model/mobile_verification_model.dart';
import 'package:terf/screens/widgets/const.dart';

class MobileVerificationServices {
  otpverfyimg(dynamic value) async {
    Response response = await Dio().post(baseUrl + mobileOtp, data: value);
    try {
      if (response == 200) {
        // var datas = await json.decode(response.data);
        return MobileVerificationResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return MobileVerificationResponseModel.fromJson(response.data);
      }
    } catch (e) {
      print("mobile otp erorrrrrreeeeeeeeeeee $e");
    }
  }
}
