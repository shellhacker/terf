import 'dart:developer';
import 'package:flutter/material.dart';

class CalenderController extends ChangeNotifier {
  DateTime? selectedDate = DateTime.now();

  DateTime now = DateTime.now();

  datePicker(context) async {
    final selectedDateTemp = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));

    if (selectedDateTemp == null) {
      log("no data");
      return null;
    } else {
      selectedDate = selectedDateTemp;
      notifyListeners();
    }
  }

  //  DateTime endDate = DateTime.parse(calendorController.selectedDate);
}
