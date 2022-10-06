import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:terf/screens/signup_signin_section/login_page/model/login_accountcreate_model.dart';
import 'package:terf/screens/widgets/const.dart';

class LoginService {
  userLogin(dynamic value) async {
    Response response = await Dio().post(baseUrl + loginUrl, data: value);

    log(response.toString());

    try {
      if (response.statusCode == 200) {
        var datas = await json.decode(response.data);
        final emailotp = datas;
        print('object_____________________$emailotp');
        return LoginRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return LoginRespoModel.fromJson(response.data);
      }
    } catch (e) {
      print("error-----------$e");
    }
  }
}
