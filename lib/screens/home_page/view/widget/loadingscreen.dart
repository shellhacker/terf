import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
      upperBound: 360,
      lowerBound: 0)
    ..repeat();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.rotate(
        angle: -(_controller.value),
        child: const Image(
          image: AssetImage('assets/6272.jpg'),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double bigLogo = 100;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(150, 100, bigLogo, bigLogo), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(
                        150, biggest.height - bigLogo - 180, bigLogo, bigLogo),
                    biggest),
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.bounceOut,
              )),
              child: const Padding(
                  padding: EdgeInsets.all(8), child: MyAnimatedWidget()),
            ),
            const Positioned(
              bottom: -220,
              right: 0,
              left: 0,
              child: EarthAnimation(),
            ),
          ],
        );
      },
    );
  }
}

class EarthAnimation extends StatefulWidget {
  const EarthAnimation({Key? key}) : super(key: key);
  @override
  _EarthAnimationState createState() => _EarthAnimationState();
}

class _EarthAnimationState extends State<EarthAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage('assets/6272.jpg'),
      ),
    );
  }
}
