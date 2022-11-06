import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:terf/screens/booking_time_slot/model/get_booking_time_slot.dart';

import '../services/get_all_turf_datails.dart';

class GetAllBookedTimeSlotController extends ChangeNotifier {
  bool? isSelected;
  bool bookedTimeVisibility = true;
  bool isLoading = false;
  List<DateSlotDetails> datas = [];
  List<List<int>> selectedDates = [];

  Future<List<DateSlotDetails>?> getAllBookedSlotTurfSlot(
      context, String idd) async {
    isLoading = true;
    GetAllTurfTimeSlot? respones =
        await GetAllBookedSlotServices().getAllBookedDetails(context);

    if (respones != null) {
      datas.clear();
      datas.addAll(respones.data!);
      isLoading = false;

      print("{datasssssssssssssssssssssss$datas}");

      notifyListeners();

      if (idd == datas) {
        print('true');
      } else {
        print('false');
      }

      for (int i = 0; i < datas.length; i++) {
        selectedDates.add(datas[i].timeSlot ?? []);
      }
      log('======================================================================lllllllllllllllllllllllllllll');
      final listone = [];
      for (var element in selectedDates) {
        element.toSet().toList().toString();
        listone.add(element.toSet().toString());
        print("worrdddddddddddddddddd{$element}");
      }
      for (var element in listone) {
        print('no repeatttttttttttttttttttttssssssssssssss{$listone}');
      }
    }

    return datas;
  }

  containIsBokked(
    index,
    id,
  ) {
    for (int i = 0; i < datas.length; i++) {
      if (id == datas[i].id) {
        final sa = datas[i].timeSlot![index];
      }
    }
  }

  passTurfDetails(
    index,
  ) {}
}
