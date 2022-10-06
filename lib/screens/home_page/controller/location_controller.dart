import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../widgets/const.dart';

class LocationController extends ChangeNotifier {
  getcurrentLocation() async {
    var p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        forceAndroidLocationManager: true);
    if (p != null) {
      print('Lat:${p.latitude},Long:${p.longitude}');
      print(p.floor);
    } else {
      print('Data Unavailabe');
    }
  }

  currentCityWeather() async {
    final response = await Dio().get(locationUrl);
    try {
      if (response == 200) {
        // var datas = await json.decode(response.data);
        final data = (response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(response.data);
      }
    } catch (e) {
      print("mobile otp erorrrrrreeeeeeeeeeee $e");
    }
  }
}
