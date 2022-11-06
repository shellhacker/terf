import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:terf/widgets/commnbckgrnd_widget.dart';
import 'package:terf/widgets/const.dart';

import '../../../widgets/comment_text.dart';
import '../../home_page/model/nearby_turf_model.dart';
import '../controller/time_slot_converssion.dart';
import '../controller/colender_controller.dart';
import '../controller/get_all_timebooked_slot.dart';
import '../widget/time_slot_widget.dart';

class BookingTimeSlotPage extends StatelessWidget {
  BookingTimeSlotPage({
    required this.turfDetails,
    super.key,
  });

  NearestTurfDetails turfDetails;

  @override
  Widget build(BuildContext context) {
    final calendorController = Provider.of<CalenderController>(context);
    final getAllBookedTimeSlotController =
        Provider.of<GetAllBookedTimeSlotController>(context);
    double width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getAllBookedTimeSlotController.getAllBookedSlotTurfSlot(context);
    });

    return CommnBckgndColor(
        child: Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        NetworkImage(turfDetails.turfLogo.toString()),
                  ),
                  TextButton.icon(
                      onPressed: () {
                        calendorController.datePicker(context);

                        // calendorController.selectedDate!
                        //         .isAfter(calendorController.now)
                        //     ? print('currentDate')
                        //     : print('oldDate');
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(DateFormat.MMMMEEEEd()
                          .format(calendorController.selectedDate!))),
                  CommnText(
                    title: 'Time Slot',
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                  ),
                  TimeSLotWidget(
                    width: width,
                    title: 'Morning',
                    types: TimeSlot.mrng,
                  ),
                  TimeSLotWidget(
                    width: width,
                    title: 'Afternoon',
                    types: TimeSlot.aftern,
                  ),
                  TimeSLotWidget(
                    width: width,
                    title: 'Evening',
                    types: TimeSlot.evning,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // var serviceStartDate = '2020-10-17';
                          // var serviceEndDate = '2022-12-23';
                          // var serviceStartTime = '10:00:00';
                          // var serviceEndTime = '11:00:00';
                          // DateTime startDate = DateTime.parse(serviceStartDate);
                          // DateTime endDate = DateTime.parse(serviceEndDate);

                          // DateTime now = DateTime.now();

                          // print('now: $now');
                          // print('startDate: $startDate');
                          // print('endDate: $endDate');
                          // print(startDate.isBefore(now));
                          // print(endDate.isAfter(now));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (_) => BookingTimeSlotPage(
                          //           turfDetails: turfDetails,
                          //         )));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        child: const Text('Continue'),
                      ),
                      kwidth5
                    ],
                  ),
                ],
              ),
            )));
  }
}
