import 'package:flutter/cupertino.dart';

import '../../home_page/model/nearby_turf_model.dart';
import '../services/search_controller_services.dart';

class SearchController extends ChangeNotifier {
  // SearchController._instans();
  // static SearchController instance = SearchController._instans();
  // factory SearchController() {
  //   return instance;
  // }
  bool? isSelected;
  TextEditingController text = TextEditingController();

  bool isLoading = false;
  List<NearestTurfDetails> datas = [];
  List<NearestTurfDetails> tempList = [];
  get context => null;

  Future<List<NearestTurfDetails>?> getAllTurfData() async {
    isLoading = true;
    TurfNearestData? respones =
        await SearchstDataGetServices().getNearestTurfDetails(context);

    if (respones != null) {
      datas.addAll(respones.data!);
      isLoading = false;

      notifyListeners();
    }

    return datas;
  }

  List<NearestTurfDetails> searchTurf(String queries) {
    tempList.clear();
    for (var element in datas) {
      if (element.turfName!.toLowerCase().contains(queries.toLowerCase())) {
        tempList.add(element);
        notifyListeners();
      }
    }
    return tempList;
  }
}
