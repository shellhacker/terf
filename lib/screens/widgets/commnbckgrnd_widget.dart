import 'package:flutter/material.dart';

class CommnBckgndColor extends StatelessWidget {
  const CommnBckgndColor({Key? key, this.child}) : super(key: key);
  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 241, 203, 70)),
      child: child,
    );
  }
}
