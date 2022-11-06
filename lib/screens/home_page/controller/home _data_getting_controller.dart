// ignore: file_names
import 'package:flutter/material.dart';
import 'package:terf/screens/home_page/model/nearby_turf_model.dart';
import '../services/home_locationbased_data_get_services.dart';

class NearestDataGetController extends ChangeNotifier {
  NearestDataGetController._instans();
  static NearestDataGetController instance =
      NearestDataGetController._instans();
  factory NearestDataGetController() {
    return instance;
  }
  bool? isSelected;

  bool isLoading = false;
  List<NearestTurfDetails> datas = [];

  // get context => null;

  Future<List<NearestTurfDetails>?> getNearestTurfData() async {
    isLoading = true;
    TurfNearestData? respones =
        await NearestDataGetServices().getNearestTurfDetails('context');

    if (respones != null) {
      datas.addAll(respones.data!);
      isLoading = false;
      notifyListeners();
      // }
      // if (respones!.data!.isEmpty) {
      //   const CircularProgressIndicator();
    }

    return datas;
  }

  catogoryChoice(newBoolValue) {
    isLoading = newBoolValue;
    notifyListeners();
  }
}
