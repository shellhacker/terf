import 'package:flutter/material.dart';

class CommnBckgndColor extends StatelessWidget {
  const CommnBckgndColor({Key? key, this.child}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 235, 240, 239)),
      child: child,
    );
  }
}
