import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/model/nearby_turf_model.dart';
import 'package:terf/screens/home_page/view/widget/aminities.dart';
import 'package:terf/widgets/comment_text.dart';

import '../../../../widgets/const.dart';
import '../../../booking_time_slot/controller/book_time_slot.dart';
import '../../../booking_time_slot/controller/time_slot_converssion.dart';
import '../../../booking_time_slot/view/booking_time_slot.dart';
import 'category_widget.dart';

class ProductDetailsSecondPage extends StatelessWidget {
  const ProductDetailsSecondPage({
    Key? key,
    required this.turfDetails,
    required this.width,
  }) : super(key: key);

  final NearestTurfDetails turfDetails;
  final double width;

  @override
  Widget build(BuildContext context) {
    final bookFreeTimeSlotController =
        Provider.of<BookFreeTimeSlotController>(context);
    final bookingTimeSLotController =
        Provider.of<BookingTimeSLotTimeController>(context);

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 133, 155, 155),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 25,
                  ),
                  const Spacer(),
                  Text(turfDetails.turfType!.turfSevens == true ? '7' : '6'),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 25,
                  ),
                ],
              ),
            ),
          ),
          kheight10,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommnText(
              title: 'Category',
              fontweight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                turfDetails.turfCategory!.turfCricket == true
                    ? CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_cricket),
                        text: 'Criket',
                        onpress: () {},
                        color: Colors.teal,
                      )
                    : CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_cricket),
                        text: 'Criket',
                        onpress: () {},
                        color: Colors.grey,
                      ),
                turfDetails.turfCategory!.turfFootball == true
                    ? CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_baseball),
                        text: 'Football',
                        onpress: () {},
                        color: Colors.teal,
                      )
                    : CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_baseball),
                        text: 'Football',
                        onpress: () {},
                        color: Colors.grey,
                      ),
                turfDetails.turfCategory!.turfBadminton == true
                    ? CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.reduce_capacity_sharp),
                        text: 'Badminton',
                        onpress: () {},
                        color: Colors.teal,
                      )
                    : CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.reduce_capacity_sharp),
                        text: 'Badminton',
                        onpress: () {},
                        color: Colors.grey,
                      ),
                turfDetails.turfCategory!.turfYoga == true
                    ? CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_gymnastics_outlined),
                        text: 'Yoga',
                        onpress: () {},
                        color: Colors.teal,
                      )
                    : CatogeryWidget(
                        width: width,
                        icon: const Icon(Icons.sports_gymnastics_outlined),
                        text: 'Yoga',
                        onpress: () {},
                        color: Colors.grey,
                      )
              ],
            ),
          ),
          CommnText(
            title: 'Aminities',
            fontweight: FontWeight.bold,
            fontSize: 20,
          ),
          AminitiesWidget(turfDetails: turfDetails),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  bookFreeTimeSlotController.clearAllList();
                  bookFreeTimeSlotController.getBookedDetails(
                      turfDetails, context);
                  bookingTimeSLotController.getAllTimeSlot(
                      turfDetails, context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BookingTimeSlotPage(
                            turfDetails: turfDetails,
                          )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const Text('Book Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
