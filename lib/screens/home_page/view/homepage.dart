import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/controller/location_controller.dart';
import 'package:terf/screens/home_page/view/widget/indicator.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/screens/widgets/const.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key, this.visibility}) : super(key: key);
  bool? visibility = true;

  @override
  Widget build(BuildContext context) {
    final singupController = Provider.of<SignupController>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final locationCOntroller =
          Provider.of<LocationController>(context, listen: false);
      locationCOntroller.getcurrentLocation();
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on_outlined)),
                  const Text('data'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_on_outlined),
                  )
                ],
              ),

              const CupertinoSearchTextField(),
              kheight20,

              CarouselSilderWidget(),

              // Container(
              //     decoration: const BoxDecoration(
              //         color: Color.fromARGB(255, 133, 155, 155),
              //         borderRadius: BorderRadius.all(Radius.circular(20))),
              //     child: Row(
              //       children: [
              //         kwidth40,
              //         kwidth10,
              //         GroundSizeIndicator(
              //           text: '5 s',
              //         ),
              //         kwidth40,
              //         GroundSizeIndicator(
              //           text: '6 s',
              //         ),
              //         kwidth40,
              //         GroundSizeIndicator(
              //           text: '7 s',
              //         ),
              //         kwidth40,
              //         GroundSizeIndicator(
              //           text: '9 s',
              //         ),
              //         kwidth40,
              //         GroundSizeIndicator(
              //           text: '11 s',
              //         ),
              //       ],
              //     )),
              kheight10,
              Expanded(
                child: AnimationLimiter(
                  child: MasonryGridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      itemBuilder: (BuildContext, context) {
                        return AnimationConfiguration.staggeredGrid(
                          position: context,
                          duration: const Duration(milliseconds: 5000),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 133, 155, 155),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(250),
                                      topRight: Radius.circular(250),
                                    )),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: const CircleAvatar(
                                        radius: 80,
                                      ),
                                    ),
                                    kheight20,
                                    const Text('Jawanes Areame'),
                                    kheight10,
                                    const Text('Thrissur'),
                                    // Visibility(
                                    // child:
                                    kheight10,
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 54, 34, 34),
                                          side: BorderSide(
                                              width: 1,
                                              color: Colors.amberAccent),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                            20,
                                          ))),
                                      onPressed: () {},
                                      child: Text(
                                        'Book Now',
                                      ),
                                    ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
  'assets/brian-vo-cbRZCj59LZw-unsplash.jpg',
  'assets/alexandra-tran-fS3tGOkp0xY-unsplash.jpg',
  'assets/meghan-holmes-wy_L8W0zcpI-unsplash.jpg'
];
