import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:terf/screens/signup_signin_section/email_verification_screen/model/signup_email_verify_model.dart';
import 'package:terf/screens/widgets/const.dart';

class EmailVerficationService extends ChangeNotifier {
  static emailVerifying(dynamic value) async {
    print("jgjhjghtfjfyjyu");
    try {
      Response response = await Dio().post(baseUrl + emailOtpUrl, data: value);
      print("---------------------------------------");
      if (response.statusCode == 200) {
        // var datas = await json.decode(response.data);
        return SignupEmailVerifyModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return SignupEmailVerifyModel.fromJson(e.response!.data);
      }
    } catch (e) {
      print("error-----------$e");
    }
  }
}
