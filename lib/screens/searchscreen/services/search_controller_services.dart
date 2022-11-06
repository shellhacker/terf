import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:terf/screens/home_page/model/nearby_turf_model.dart';
import 'package:terf/widgets/const.dart';

import '../../../services/interseptor.dart';

class SearchstDataGetServices {
  SearchstDataGetServices._instans();
  static SearchstDataGetServices instance = SearchstDataGetServices._instans();
  factory SearchstDataGetServices() {
    return instance;
  }

  Future<TurfNearestData?> getNearestTurfDetails(context) async {
    try {
      Dio dio = await HelperIntercepter().getApiClient();
      Response response = await dio.get(searchTurfApi);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return TurfNearestData.fromJson(response.data);
      } else {
        return TurfNearestData.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Server Not Authenticated'),
            backgroundColor: Color.fromARGB(255, 57, 57, 57)));
      } else if (e.type == DioErrorType.connectTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Cheack your connection'),
            backgroundColor: Color.fromARGB(255, 57, 57, 57)));
        log('somthing--Cheack your connection---error==============$e');
      } else if (e.type == DioErrorType.receiveTimeout) {
        log('somthing-----------Diooooooo------error==============$e');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Timeout Error')));
      } else if (e.type == DioErrorType.other) {
        log('somthing---------receiveTimeout----error==============$e');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Somthing Error')));
      }
    } catch (e) {
      log('error------$e');
    }
    return null;
  }
}
