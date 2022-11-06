import 'package:flutter/material.dart';

import '../model/nearby_turf_model.dart';

class ProductDetailsController extends ChangeNotifier {
  List images = [];
  getImages(NearestTurfDetails turfDetails) {
    images.clear();
    images.add(turfDetails.turfImages!.turfImages1);
    images.add(turfDetails.turfImages!.turfImages2);
    images.add(turfDetails.turfImages!.turfImages3);
  }
}
