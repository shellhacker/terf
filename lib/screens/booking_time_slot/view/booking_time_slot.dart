import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:terf/widgets/color.dart';
import 'package:terf/widgets/commnbckgrnd_widget.dart';
import 'package:terf/widgets/const.dart';

import '../../../widgets/comment_text.dart';
import '../../home_page/model/nearby_turf_model.dart';
import '../controller/book_time_slot.dart';
import '../controller/time_slot_converssion.dart';
import '../controller/colender_controller.dart';
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
    final bookFreeTimeSlotController =
        Provider.of<BookFreeTimeSlotController>(context);

    double width = MediaQuery.of(context).size.width;
    final date =
        DateFormat.MMMMEEEEd().format(calendorController.selectedDate!);

    WidgetsBinding.instance.addPostFrameCallback((_) {});

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
                      label: Text(date
                          // DateFormat.MMMMEEEEd()
                          //   .format(calendorController.selectedDate!)
                          )),
                  CommnText(
                    title: 'Time Slot',
                    fontSize: 20,
                    fontweight: FontWeight.bold,
                  ),
                  TimeSLotWidget(
                    turfDetails: turfDetails,
                    width: width,
                    title: 'Morning',
                    types: TimeSlot.mrng,
                  ),
                  TimeSLotWidget(
                    turfDetails: turfDetails,
                    width: width,
                    title: 'Afternoon',
                    types: TimeSlot.aftern,
                  ),
                  TimeSLotWidget(
                    turfDetails: turfDetails,
                    width: width,
                    title: 'Evening',
                    types: TimeSlot.evning,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        // elevation: 10,
                        // gives rounded corner to modal bottom screen
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        builder: (BuildContext context) {
                          // UDE : SizedBox instead of Container for whitespaces
                          return SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                      )),
                                  width: 250.0,
                                  child: Center(
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        ColorizeAnimatedText(
                                          'Larry Page',
                                          textStyle: colorizeTextStyle,
                                          colors: colorizeColors,
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // bookFreeTimeSlotController.continueBooking(
                                    //     date, turfDetails, context);

                                    //////////////////////////////////////////////////////////
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Continue'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      // bookFreeTimeSlotController.continueBooking(
                      //     date, turfDetails, context);

                      //////////////////////////////////////////////////////////
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
                  kwidth5,
                  MaterialButton(
                    height: 58,
                    minWidth: 340,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      // bookFreeTimeSlotController.continueBooking(
                      //     date, turfDetails, context);
                    },
                    color: Colors.pink,
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
