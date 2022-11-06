import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../model/location_model.dart';

late final userData;

class GetUserLoction extends ChangeNotifier {
  GetUserLoction() {
    _location = Location();
  }

  dynamic userDetails;
  Location? _location;
  Location? get location => _location;

  getUserLocation() async {
    const token =
        'pk.eyJ1Ijoic2hhYmFuYXMiLCJhIjoiY2w5bXV6bHQ0MDFpZTNubXVnc2RuZnN5bCJ9.v2m-75Pm89_N4INHnTf9mg';
    bool serviceEnabled;
    PermissionStatus permissionGrantend;

    serviceEnabled = await location!.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location!.requestService();

      if (!serviceEnabled) {}
    }
    permissionGrantend = await location!.hasPermission();
    if (permissionGrantend == PermissionStatus.denied) {
      permissionGrantend = await location!.requestPermission();
      if (permissionGrantend != PermissionStatus.granted) {}
    }

    try {
      LocationData locationData = await location!.getLocation();

      double latitude = locationData.latitude!;
      double longitude = locationData.longitude!;
      log("response  lat: $latitude");
      log("response  lng: $longitude");
      Response response = await Dio().get(
          "https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json?limit=1&types=place%2Cpostcode%2Clocality&access_token=$token");
      log(
        "response : ${response.data}",
      );
      if (response.statusCode == 200) {
        userData = UserLocationModel.fromJson(response.data);

        log(userData.features!.first.placeName!);

        userDetails = userData.features!.first.placeName;
        notifyListeners();
      }
    } catch (e) {
      log("response  error : $e");
    }
  }
}
