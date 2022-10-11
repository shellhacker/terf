import 'package:flutter/material.dart';
import 'package:terf/screens/widgets/const.dart';

class StaticCard extends StatelessWidget {
  const StaticCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .18,
      // decoration: boxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Muhammed...",
                  // style: textStyle.copyWith(
                  //   color: secondaryColor,
                  // ),
                ),
                kheight10,
                Text(
                  "Explore vanues and\nbook your favourite spot.",
                  style: textStyle.copyWith(
                    fontSize: 13,
                    color: Colors.grey.shade300,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Container(
              height: size.height / 1,
              width: size.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/messi.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}