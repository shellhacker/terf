import 'package:flutter/material.dart';
import 'package:terf/screens/widgets/const.dart';
import 'package:terf/screens/widgets/material_button.dart';

class TurfContainer extends StatelessWidget {
  final String turfName;
  final String turfPlace;
  final String turfImage;
  final bool visible;
  final Function() bookOnclick;
  final Function() cardOnTap;

  const TurfContainer({
    Key? key,
    required this.visible,
    required this.turfName,
    required this.turfPlace,
    required this.turfImage,
    required this.cardOnTap,
    required this.bookOnclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardOnTap,
      child: Container(
        decoration: boxDecoration.copyWith(
          color: Colors.redAccent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(100),
            topLeft: Radius.circular(100),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(turfImage),
              ),
              kheight10,
              Text(
                turfName,
                textAlign: TextAlign.center,
                style: textStyle.copyWith(fontSize: 16),
                maxLines: 1,
              ),
              kheight5,
              Text(
                turfPlace,
                style: textStyle.copyWith(fontSize: 14, color: Colors.grey),
                maxLines: 1,
              ),
              kheight5,
              kheight10,
              Visibility(
                visible: visible,
                child: MaterialButtonWidget(
                  height: 35,
                  text: "Book",
                  color: Colors.red,
                  textColor: Colors.red,
                  onClick: bookOnclick,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
