import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:terf/screens/signup_signin_section/login_page/model/login_accountcreate_model.dart';
import 'package:terf/widgets/const.dart';

import '../model/get_booking_time_slot.dart';

class GetAllBookedSlotServices {
  Future<List<BookNowTimeSlot>?> getAllBookedDetails(id, context) async {
    try {
      Response response = await Dio().get(baseUrl + getBookedTimeSlot + id);

      if (response.statusCode == 200) {
        //first way for getting data from data///////
        //  return List<BookNowTimeSlot>.from(
        // response.data["data"].map((x) => BookNowTimeSlot.fromJson(x)));

        //second way for gettinf data from data///////
        return GetAllTurfTimeSlot.fromJson(response.data).data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Server Not Founded'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97)));
        print(e);
      } else if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Connection Time out')));
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Timeout Error')));
      } else if (e.type == DioErrorType.other) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Network Error')));
        print('errorrr$e');
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error Founded: $e'),
          backgroundColor: const Color.fromARGB(255, 73, 73, 73)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error Founded: $e'),
          backgroundColor: const Color.fromARGB(255, 47, 48, 47)));
      print('errorrr$e');
    }
    return null;
    // return LoginRespoModel.fromJson(response.data);
  }
}

FlutterSecureStorage secureStorage = const FlutterSecureStorage();
getToken(GetAllTimeSlot value) async {
  await secureStorage.write(key: 'Token', value: value.token);
  await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
  await secureStorage.write(key: 'loginTrue', value: 'true');
}
