import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/model/signup_accountcreate_model.dart';
import 'package:terf/screens/widgets/const.dart';

class SignupService extends ChangeNotifier {
  signupUser(dynamic value) async {
    print('haiiiiiiiiiiii');
    final response = await Dio().post(baseUrl + signupUrl, data: value);

    // log(response.toString());

    try {
      if (response.statusCode == 200) {
        var datas = await json.decode(response.data);
        final emailotp = datas;
        print('object_____________________$emailotp');
        return SignUpRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return SignUpRespoModel.fromJson(response.data);
      }
    } catch (e) {
      print("error-----------$e");
    }
  }
}
