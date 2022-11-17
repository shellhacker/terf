import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/booking_time_slot/controller/time_slot_converssion.dart';

import '../../home_page/model/nearby_turf_model.dart';
import '../model/get_booking_time_slot.dart';
import '../services/book_free_time.dart';
import '../services/get_all_turf_datails.dart';
import 'colender_controller.dart';

class BookFreeTimeSlotController extends ChangeNotifier {
  String? selectedDate;
  List<int> selectedTimes = [];
  List toSetDupvalues = [];
  List mrngAlreadyBooked = [];
  static DateTime currentTime = DateTime.now();
  String currentTimeConverted = DateFormat('kk:mm').format(currentTime);

  List<BookNowTimeSlot>? getAllBookedDeatils = [];

  void parseBookingTime(int timeForApi) {
    selectedTimes.add(timeForApi);
    toSetDupvalues.addAll(selectedTimes.toSet().toList());
    toSetDupvalues = toSetDupvalues.toSet().toList();
    print(toSetDupvalues);
  }

  getBookedDetails(NearestTurfDetails data, context) async {
    final dynamic turfId = data.id;
    getAllBookedDeatils =
        await GetAllBookedSlotServices().getAllBookedDetails(turfId, context);
  }

  lastfunction(BuildContext context, int index, TimeSlot type) {
    final calendorController =
        Provider.of<CalenderController>(context, listen: false);
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context, listen: false);

    DateTime date = calendorController.selectedDate!;
    //userSelected Date//
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    final String formattedSelectedDate = formatter.format(date);

    //currentDate//
    final String formatteCurrentDate = formatter.format(currentTime);

    print("selected dateeeeeeeeeee$formattedSelectedDate");

    print("curretn dateeeeeeeeeee$formatteCurrentDate");

    if (formatteCurrentDate == formattedSelectedDate) {
      //user selected time//
      String userSelectedTime = type == TimeSlot.aftern
          ? bookingTimeSLotController.afternoon[index]
          : type == TimeSlot.mrng
              ? bookingTimeSLotController.mornigTimeSlot[index]
              : bookingTimeSLotController.evening[index];
      List splittedTimeUser = userSelectedTime.split(':');
      int userSelectedVerifedTime = int.parse(splittedTimeUser[0]);

      print("user selected time afternooon $userSelectedVerifedTime");

      //current Time//
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.Hms().format(now);
      List splittedCurrentTime = formattedTime.split(':');
      int verifiedCurrentTime = int.parse(splittedCurrentTime[0]);

      if (type == TimeSlot.aftern || type == TimeSlot.evning) {
        final currentTimeresp = verifiedCurrentTime > 12
            ? verifiedCurrentTime - 12
            : verifiedCurrentTime;
        print(' coverted currenttimee---------------------- $currentTimeresp');
        print("afterreeeeeeee$userSelectedVerifedTime");
        if (userSelectedVerifedTime <= currentTimeresp) {
          toSetDupvalues.remove(userSelectedVerifedTime);

          print(toSetDupvalues);

          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Time Experied')));
        } else {
          final value = userSelectedVerifedTime + 12;
          for (int i = 0; i < getAllBookedDeatils!.length; i++) {
            if (formatteCurrentDate == getAllBookedDeatils?[i].bookingDate) {
              for (int j = 0;
                  j < getAllBookedDeatils![i].timeSlot!.length;
                  j++) {
                if (getAllBookedDeatils![i].timeSlot!.contains(value)) {
                  toSetDupvalues.remove(value);
                  notifyListeners();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Already Booked')));
                  // alreadyBooked.add(value);
                } else {
                  selectedTimes.add(value);
                  toSetDupvalues.addAll(selectedTimes.toSet().toList());
                  toSetDupvalues = toSetDupvalues.toSet().toList();
                  print(toSetDupvalues);
                }
              }
            }
          }
        }
      } else {
        print('mmmmmmmmmmmmmmmmmmmmmmrng$userSelectedVerifedTime');

        final currentTimeresp = verifiedCurrentTime;
        print(' coverted currenttimee $currentTimeresp');
        print("afterreeeeeeee$userSelectedVerifedTime");
        if (userSelectedVerifedTime <= currentTimeresp) {
          toSetDupvalues.remove(userSelectedVerifedTime);

          print(toSetDupvalues);

          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Time Experied')));
        } else {
          for (int i = 0; i < getAllBookedDeatils!.length; i++) {
            if (formatteCurrentDate == getAllBookedDeatils?[i].bookingDate) {
              for (int j = 0;
                  j < getAllBookedDeatils![i].timeSlot!.length;
                  j++) {
                if (getAllBookedDeatils![i]
                    .timeSlot!
                    .contains(userSelectedVerifedTime)) {
                  toSetDupvalues.remove(userSelectedVerifedTime);
                  notifyListeners();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Already Booked')));
                  mrngAlreadyBooked.add(userSelectedVerifedTime);
                } else {
                  parseBookingTime(userSelectedVerifedTime);
                }
              }
            }
          }
        }
      }
    } else {
      String userSelectedTime = type == TimeSlot.aftern
          ? bookingTimeSLotController.afternoon[index]
          : type == TimeSlot.mrng
              ? bookingTimeSLotController.mornigTimeSlot[index]
              : bookingTimeSLotController.evening[index];
      List splittedTimeUser = userSelectedTime.split(':');
      int userSelectedverifedtimeSlot = int.parse(splittedTimeUser[0]);

      if (type == TimeSlot.aftern || type == TimeSlot.evning) {
        int timeResponse = userSelectedverifedtimeSlot < 12
            ? userSelectedverifedtimeSlot + 12
            : userSelectedverifedtimeSlot;
        print("another Darteeeeeeeeeeeeeeee$userSelectedverifedtimeSlot+12");
        print("another Darteeeeeeeeeeeeeeee$timeResponse");

        for (int i = 0; i < getAllBookedDeatils!.length; i++) {
          if (formattedSelectedDate == getAllBookedDeatils?[i].bookingDate) {
            for (int j = 0; j < getAllBookedDeatils![i].timeSlot!.length; j++) {
              if (getAllBookedDeatils![i].timeSlot!.contains(timeResponse)) {
                toSetDupvalues.remove(timeResponse);
                notifyListeners();
                print('another date evengggggggggggggg$toSetDupvalues');
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Already Booked')));
              } else {
                parseBookingTime(timeResponse);
                print('booked');
              }
            }
          }
        }
      } else {
        for (int i = 0; i < getAllBookedDeatils!.length; i++) {
          if (formattedSelectedDate == getAllBookedDeatils?[i].bookingDate) {
            for (int j = 0; j < getAllBookedDeatils![i].timeSlot!.length; j++) {
              if (getAllBookedDeatils![i]
                  .timeSlot!
                  .contains(userSelectedverifedtimeSlot)) {
                toSetDupvalues.remove(userSelectedverifedtimeSlot);
                notifyListeners();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Already Booked')));
              } else {
                parseBookingTime(userSelectedverifedtimeSlot);
                print('booked');
              }
            }
          }
        }
      }

      // will test seteclted dates
    }
  }

  checkExpeiry(BuildContext context, int index, TimeSlot type) {
    final calendorController =
        Provider.of<CalenderController>(context, listen: false);
    DateTime date = calendorController.selectedDate!;
    notifyListeners();
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context, listen: false);
////////// time converted   /////////////

    String userSelectedTime = type == TimeSlot.aftern
        ? bookingTimeSLotController.afternoon[index]
        : type == TimeSlot.mrng
            ? bookingTimeSLotController.mornigTimeSlot[index]
            : bookingTimeSLotController.evening[index];
    List splittedTimeUser = userSelectedTime.split(':');
    int dateForVerify = int.parse(splittedTimeUser[0]);
    print(dateForVerify);

    List spittedCurrentTime = currentTimeConverted.split(':');
    int currentimeFinal = int.parse(spittedCurrentTime[0]);
    print('------------------$currentimeFinal');

    if (type == TimeSlot.aftern || type == TimeSlot.evning) {
      final c = dateForVerify + 12;
      if (c < currentimeFinal) {
        print(c);
        print('time expired');
      }
    } else {
      if (dateForVerify < currentimeFinal) {
        print('time expired');
      }
    }
  }

  containinBooked(BuildContext context, int index, TimeSlot type) async {
    final calendorController =
        Provider.of<CalenderController>(context, listen: false);
    DateTime date = calendorController.selectedDate!;
    notifyListeners();
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context, listen: false);

    String fullTimeString = type == TimeSlot.aftern
        ? bookingTimeSLotController.afternoon[index]
        : type == TimeSlot.mrng
            ? bookingTimeSLotController.mornigTimeSlot[index]
            : bookingTimeSLotController.evening[index];

    List splitted = fullTimeString.split(':');
    int timeForApi = int.parse(splitted[0]);

    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    final String formatted = formatter.format(date);
    if (type == TimeSlot.aftern || type == TimeSlot.evning) {
      timeForApi = timeForApi + 12;
      for (int i = 0; i < getAllBookedDeatils!.length; i++) {
        if (formatted == getAllBookedDeatils?[i].bookingDate) {
          for (int j = 0; j < getAllBookedDeatils![i].timeSlot!.length; j++) {
            if (getAllBookedDeatils![i].timeSlot!.contains(timeForApi)) {
              // isSelected[index] = false;
              notifyListeners();
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Already Booked')));
            } else {
              parseBookingTime(timeForApi);
            }
          }
        } else {
          parseBookingTime(timeForApi);
        }
      }
    } else {
      // print('mrnggggggggggggggggggggggggggggggggggg');
      for (int i = 0; i < getAllBookedDeatils!.length; i++) {
        if (formatted == getAllBookedDeatils?[i].bookingDate) {
          for (int j = 0; j < getAllBookedDeatils![i].timeSlot!.length; j++) {
            if (getAllBookedDeatils![i].timeSlot!.contains(timeForApi)) {
              // print('already...........................');

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Already Booked')));
            }
          }
        } else {
          parseBookingTime(timeForApi);
        }
      }
      // for (int i = 0; i < toSetDupvalues.length; i++) {
      //   if (toSetDupvalues.contains(timeForApi)) {
      //     toSetDupvalues.remove(timeForApi);
      //   }
      // }
      // print(toSetDupvalues);
    }
  }

  falseCase(BuildContext context, int index, TimeSlot type) {
    // getDatas.timeSlot = [];
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context, listen: false);
    String fullTimeString = type == TimeSlot.aftern
        ? bookingTimeSLotController.afternoon[index]
        : type == TimeSlot.mrng
            ? bookingTimeSLotController.mornigTimeSlot[index]
            : bookingTimeSLotController.evening[index];

    List splitted = fullTimeString.split(':');
    int timeForApi = int.parse(splitted[0]);

    if (type == TimeSlot.aftern || type == TimeSlot.evning) {
      timeForApi = timeForApi + 12;
      for (int i = 0; i < toSetDupvalues.length; i++) {
        if (toSetDupvalues.contains(timeForApi)) {
          toSetDupvalues.remove(timeForApi);
        }
      }
      print(toSetDupvalues);
    } else {
      for (int i = 0; i < toSetDupvalues.length; i++) {
        if (toSetDupvalues.contains(timeForApi)) {
          toSetDupvalues.remove(timeForApi);
        }
      }
      print('fghjklkhjgfdsfghj$toSetDupvalues');
    }
  }

  clearAllList() {
    // getDatas.timeSlot?.clear();
    selectedTimes.clear();
    toSetDupvalues.clear();
    notifyListeners();
  }

  continueBooking(String bookinDate, NearestTurfDetails data, context) {
    print('heloooo');
    final bookingDate = bookinDate;
    final turfid = data.id;

    List<int> timeSlotData = [];
    for (int i = 0; i < toSetDupvalues.length; i++) {
      timeSlotData.add(toSetDupvalues[i]);
    }
    print(turfid);
    BookNowTimeSlot turfDetails = BookNowTimeSlot(
        bookingDate: bookingDate, id: turfid, timeSlot: timeSlotData);
    BookFreeSlotServices.bookFreeTime(turfDetails, context);
  }
}
