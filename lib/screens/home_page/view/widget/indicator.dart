import 'package:flutter/material.dart';

class GroundSizeIndicator extends StatelessWidget {
  GroundSizeIndicator({Key? key, this.color, this.text}) : super(key: key);
  final Color? color;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 30,
          height: 20,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Text(text!)),
    );
  }
}
