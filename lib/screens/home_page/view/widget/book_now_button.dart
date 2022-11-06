import 'package:flutter/material.dart';

class BookNowButton extends StatelessWidget {
  BookNowButton(
      {Key? key,
      this.left,
      this.right,
      this.text,
      this.top,
      this.bottom,
      this.color,
      this.function})
      : super(key: key);
  double? left;
  double? right;
  String? text;
  double? top;
  double? bottom;
  Color? color;
  Function? function;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color!,
            side: const BorderSide(width: 1, color: Colors.amberAccent),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              20,
            ))),
        onPressed: () {
          function;
        },
        child: Text(text!),
      ),
    );
  }
}
