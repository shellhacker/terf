import 'package:flutter/material.dart';

class CatogeryWidget extends StatelessWidget {
  CatogeryWidget(
      {Key? key,
      required this.width,
      required this.onpress,
      required this.text,
      required this.color,
      required this.icon})
      : super(key: key);

  final double width;
  final Function() onpress;
  String text;
  Icon icon;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 3,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Row(
        children: [
          IconButton(icon: icon, onPressed: onpress),
          Text(text),
        ],
      ),
    );
  }
}
