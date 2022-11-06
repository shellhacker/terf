import 'package:flutter/material.dart';

class CommnText extends StatelessWidget {
  CommnText(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontweight,
      this.overflow});
  String title;
  Color? color;
  FontWeight? fontweight;
  double? fontSize;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontweight,
          overflow: overflow,
        ),
      ),
    );
  }
}
