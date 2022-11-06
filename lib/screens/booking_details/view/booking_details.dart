import 'package:flutter/material.dart';
import 'package:terf/widgets/const.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          CircleAvatar(),
          kheight20,
        ],
      )),
    );
  }
}
