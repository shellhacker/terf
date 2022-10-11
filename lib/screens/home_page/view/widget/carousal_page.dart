import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSilderWidget extends StatelessWidget {
  const CarouselSilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: curouselImageList
            .map((item) => SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
        ));
  }
}

final List<String> curouselImageList = [
  'assets/9202.jpg',
  'assets/sport-35488.png',
  'assets/kindpng_4187098.png'
];
