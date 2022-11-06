import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/view/widget/product_details_second_page.dart';
import 'package:terf/widgets/comment_text.dart';
import 'package:terf/widgets/commnbckgrnd_widget.dart';
import 'package:terf/widgets/const.dart';

import '../controller/product_details.dart';
import '../model/nearby_turf_model.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.turfDetails});
  NearestTurfDetails turfDetails;
  bool visibility = false;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsController>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        int currentPage = 0;

        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage = 0;
        }

        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    });

    List<Widget> a() {
      int rating = turfDetails.turfInfo!.turfRating!.toInt();
      return List.generate(5, (index) {
        return rating <= index
            ? const Icon(Icons.star_border_outlined)
            : const Icon(
                Icons.star_outlined,
                color: Colors.yellow,
              );
      });
    }

    return CommnBckgndColor(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: CommnText(
                title: 'Details',
              ),
            ),
            body: SafeArea(
                child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: height / 3,
                  child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          height: 370,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                productDetailsController.images[index]),
                          ),
                        );
                      }),
                ),
                kheight10,
                SizedBox(
                  width: double.infinity,
                  child: Column(children: [
                    Row(
                      children: [
                        kwidth20,
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          child: const Text('Cost Details'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          child: const Text('Locat Now'),
                        ),
                        kwidth20
                      ],
                    ),
                    CommnText(
                      title: turfDetails.turfName ?? 'No data',
                      fontSize: 30,
                      fontweight: FontWeight.bold,
                    ),
                    kheight5,
                    CommnText(
                      title: turfDetails.turfPlace ?? 'No data',
                      fontSize: 20,
                    ),
                    Row(children: [
                      ...a(),
                      const Spacer(),
                      TextButton(
                        child: const Text(
                          'Show More',
                        ),
                        onPressed: () {
                          visibility = true;
                        },
                      ),
                    ]),
                    // Visibility(
                    //     visible: visibility, child: const Text('Address')),
                    const Divider(
                      thickness: 4,
                    ),
                  ]),
                ),
                ProductDetailsSecondPage(
                    turfDetails: turfDetails, width: width),
              ],
            ))));
  }
}
