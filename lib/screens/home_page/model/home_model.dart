class TurfeMainDataModel {
  TurfeMainDataModel({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  List<TurfDataModel>? data;
  String? message;

  factory TurfeMainDataModel.fromJson(Map<String, dynamic> json) =>
      TurfeMainDataModel(
        status: json["status"],
        data: List<TurfDataModel>.from(
            json["data"].map((x) => TurfDataModel.fromJson(x))),
      );
}

class TurfDataModel {
  TurfDataModel({
    this.turfCatogery,
    this.turfType,
    this.turfInfo,
    this.turfAmenities,
    this.turfImages,
    this.turfTime,
    this.id,
    this.turfCreatorId,
    this.turfName,
    this.turfPlace,
    this.turfMuncipality,
    this.v,
  });

  TurfCatogery? turfCatogery;
  TurfType? turfType;
  TurfInfo? turfInfo;
  TurfAmenities? turfAmenities;
  TurfImages? turfImages;
  TurfTime? turfTime;
  String? id;
  String? turfCreatorId;
  String? turfName;
  String? turfPlace;
  String? turfMuncipality;
  int? v;

  factory TurfDataModel.fromJson(Map<String, dynamic> json) => TurfDataModel(
        turfCatogery: TurfCatogery.fromJson(json["turf_catogery"]),
        turfType: TurfType.fromJson(json["turf_type"]),
        turfInfo: TurfInfo.fromJson(json["turf_info"]),
        turfAmenities: TurfAmenities.fromJson(json["turf_amenities"]),
        turfImages: TurfImages.fromJson(json["turf_images"]),
        turfTime: TurfTime.fromJson(json["turf_time"]),
        id: json["_id"],
        turfCreatorId: json["turf_creator_id"],
        turfName: json["turf_name"],
        turfPlace: json["turf_place"],
        turfMuncipality: json["turf_muncipality"],
        v: json["__v"],
      );
}

class TurfAmenities {
  TurfAmenities({
    this.turfWashroom,
    this.turfWater,
    this.turfDressing,
    this.turfParking,
    this.turfGallery,
    this.turfCafeteria,
  });

  bool? turfWashroom;
  bool? turfWater;
  bool? turfDressing;
  bool? turfParking;
  bool? turfGallery;
  bool? turfCafeteria;

  factory TurfAmenities.fromJson(Map<String, dynamic> json) => TurfAmenities(
        turfWashroom: json["turf_washroom"],
        turfWater: json["turf_water"],
        turfDressing: json["turf_dressing"],
        turfParking: json["turf_parking"],
        turfGallery: json["turf_gallery"],
        turfCafeteria: json["turf_cafeteria"],
      );
}

class TurfCatogery {
  TurfCatogery({
    this.turfCricket,
    this.turfFootball,
    this.turfBadminton,
    this.turfYoga,
  });

  bool? turfCricket;
  bool? turfFootball;
  bool? turfBadminton;
  bool? turfYoga;

  factory TurfCatogery.fromJson(Map<String, dynamic> json) => TurfCatogery(
        turfCricket: json["turf_cricket"],
        turfFootball: json["turf_football"],
        turfBadminton: json["turf_badminton"],
        turfYoga: json["turf_yoga"],
      );
}

class TurfImages {
  TurfImages({
    this.turfImages1,
    this.turfImages2,
    this.turfImages3,
  });

  String? turfImages1;
  String? turfImages2;
  String? turfImages3;

  factory TurfImages.fromJson(Map<String, dynamic> json) => TurfImages(
        turfImages1: json["turf_images1"],
        turfImages2: json["turf_images2"],
        turfImages3: json["turf_images3"],
      );
}

class TurfInfo {
  TurfInfo({
    this.turfIsAvailale,
    this.turfRating,
    this.turfMap,
  });

  bool? turfIsAvailale;
  double? turfRating;
  String? turfMap;

  factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
        turfIsAvailale: json["turf_isAvailale"],
        turfRating: json["turf_rating"].toDouble(),
        turfMap: json["turf_map"],
      );
}

class TurfTime {
  TurfTime({
    this.timeMorning,
    this.timeAfternoon,
    this.timeEvening,
  });

  String? timeMorning;
  String? timeAfternoon;
  String? timeEvening;

  factory TurfTime.fromJson(Map<String, dynamic> json) => TurfTime(
        timeMorning: json["time_morning"],
        timeAfternoon: json["time_afternoon"],
        timeEvening: json["time_evening"],
      );
}

class TurfType {
  TurfType({
    this.turfSevens,
    this.turfSixes,
  });

  bool? turfSevens;
  bool? turfSixes;

  factory TurfType.fromJson(Map<String, dynamic> json) => TurfType(
        turfSevens: json["turf_sevens"],
        turfSixes: json["turf_sixes"],
      );
}
