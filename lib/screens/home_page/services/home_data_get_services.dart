import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:terf/screens/widgets/const.dart';

import '../model/home_model.dart';

class HomeDataGetServices {
  static Future<TurfeMainDataModel?> getData() async {
    // print('object------------------');
    // print('response------------');
    // print(response.data);
    // print('statuscode${response.statusCode}');
    //TurfeMainDataModel turfdatas = TurfeMainDataModel.fromJson(response.data);
    // print('detailshcjbdcbkbkscbkbc------------${turfdatas.data?[0].turfName}');

    try {
      Response response = await Dio().get(getHomeDataApi);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return TurfeMainDataModel.fromJson(response.data);
      } else {
        return TurfeMainDataModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return TurfeMainDataModel(message: '401');
      } else if (e.type == DioErrorType.connectTimeout) {
        return TurfeMainDataModel(message: 'Cheack your connection');
      } else if (e.type == DioErrorType.receiveTimeout) {
        return TurfeMainDataModel(message: 'Cheack your connection');
      } else if (e.type == DioErrorType.other) {
        return TurfeMainDataModel(message: 'Cheack your connection');
      }
    } catch (e) {
      print('error------$e');
    }
  }
}
