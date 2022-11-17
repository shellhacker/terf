import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/comment_text.dart';
import '../../home_page/model/nearby_turf_model.dart';
import '../controller/book_time_slot.dart';
import '../controller/time_slot_converssion.dart';

List<bool> isSelected = [];

class TimeSLotWidget extends StatelessWidget {
  TimeSLotWidget(
      {Key? key,
      required this.width,
      required this.title,
      required this.types,
      required this.turfDetails})
      : super(key: key);
  final NearestTurfDetails turfDetails;
  final double width;
  String title;
  TimeSlot types;

  @override
  Widget build(BuildContext context) {
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context);
    final bookFreeTimeSlotController =
        Provider.of<BookFreeTimeSlotController>(context);

    List<bool> isSelected = types == TimeSlot.aftern
        ? bookingTimeSLotController.afternoonSelected
        : types == TimeSlot.mrng
            ? bookingTimeSLotController.mrngSelected
            : bookingTimeSLotController.eveningSelected;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookFreeTimeSlotController.getBookedDetails(turfDetails, context);
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommnText(title: title, fontSize: 20, fontweight: FontWeight.bold),
          GridView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: types == TimeSlot.aftern
                  ? bookingTimeSLotController.afternoon.length
                  : types == TimeSlot.mrng
                      ? bookingTimeSLotController.mornigTimeSlot.length
                      : bookingTimeSLotController.evening.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 50,
                  mainAxisExtent: 50),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    isSelected[index] = !isSelected[index];
                    bookingTimeSLotController.notifyListeners();

                    if (isSelected[index]) {
                      bookFreeTimeSlotController.selectedTimes.clear();
                      // bookFreeTimeSlotController.lastfunction(
                      // context, index, types);
                      // bookFreeTimeSlotController.checkExpeiry(
                      //     context, index, types);
                      bookFreeTimeSlotController.containinBooked(
                          context, index, types);
                    } else {
                      bookFreeTimeSlotController.falseCase(
                          context, index, types);
                      print("dggggggg$isSelected");
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: isSelected[index] == true
                            ? Colors.teal
                            : types == TimeSlot.mrng
                                ? bookFreeTimeSlotController
                                        .mrngAlreadyBooked[index]
                                    ? Colors.white
                                    : const Color.fromARGB(255, 133, 155, 155)
                                : Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                    child: Center(
                      child: Text(types == TimeSlot.aftern
                          ? bookingTimeSLotController.afternoon[index]
                          : types == TimeSlot.mrng
                              ? bookingTimeSLotController.mornigTimeSlot[index]
                              : bookingTimeSLotController.evening[index]),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
