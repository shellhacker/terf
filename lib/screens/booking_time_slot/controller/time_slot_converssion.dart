import 'package:flutter/cupertino.dart';
import 'package:terf/screens/home_page/model/nearby_turf_model.dart';

class BookingTimeSLotTimeController extends ChangeNotifier {
  List mornigTimeSlot = [];
  List afternoon = [];
  List evening = [];
  List<bool> afternoonSelected = [];
  List<bool> isSelectedAftern() => afternoonSelected;
  List<bool> eveningSelected = [];
  List<bool> isSelectedEvening() => eveningSelected;
  List<bool> mrngSelected = [];
  List<bool> isSelectedMrng() => mrngSelected;
  // Map<String, dynamic> getMrngSlot = {'mrngStrtTime': '', 'mrngEndTime': ''};

  getAllTimeSlot(NearestTurfDetails details, context) {
    getMrngSlotTime(details);
    getAfternoonTimeSlot(details);
    getEveningTimeSlot(details);
  }

  getMrngSlotTime(NearestTurfDetails details) {
    int mornigTimeSlotEnd = details.turfTime!.timeMorningEnd!.toInt();
    int mornigTimeSlotStart = details.turfTime!.timeMorningStart!.toInt();
    mornigTimeSlot.clear();

    for (int i = mornigTimeSlotStart; i <= mornigTimeSlotEnd - 1; i++) {
      int timeStart = i;
      int timeEnd = i + 1;

      final time = "$timeStart:00 - $timeEnd:00";
      mornigTimeSlot.add(time);
      // getMrngSlot.update('mrngStrtTime', (value) => timeStart);
      // getMrngSlot.update('mrngEndTime', (value) => timeEnd);

      // print(getMrngSlot);
      // const Text('zxcvcvb');
    }

    mrngSelected = List.generate(mornigTimeSlot.length, (index) => false);
    notifyListeners();
  }

  getAfternoonTimeSlot(NearestTurfDetails details) {
    int afternoonTimeSlotEnd = details.turfTime!.timeAfternoonEnd!.toInt();
    int afternoonTimeSlotStart = details.turfTime!.timeAfternoonStart!.toInt();
    afternoon.clear();
    for (int i = afternoonTimeSlotStart; i <= afternoonTimeSlotEnd - 1; i++) {
      int timeStart = i > 12 ? i + 1 - 12 : i;
      int timeEnd = i + 1 > 12 ? i + 2 - 12 : i;

      final time = "$timeStart:00 - $timeEnd:00";

      afternoon.add(time);
    }
    afternoonSelected = List.generate(afternoon.length, (index) => false);
    notifyListeners();
  }

  getEveningTimeSlot(NearestTurfDetails details) {
    int eveningTimeSlotEnd = details.turfTime!.timeEveningEnd!.toInt();
    int eveningTimeSlotStart = details.turfTime!.timeEveningStart!.toInt();

    evening.clear();
    for (int i = eveningTimeSlotStart; i < eveningTimeSlotEnd - 1; i++) {
      int timeStart = i > 12 ? i + 1 - 12 : i;
      int timeEnd = i + 1 > 12 ? i + 2 - 12 : i;

      final time = "$timeStart:00 - $timeEnd:00";

      evening.add(time);
    }
    eveningSelected = List.generate(evening.length, (index) => false);
    notifyListeners();
  }
}

enum TimeSlot {
  mrng,
  aftern,
  evning,
}
