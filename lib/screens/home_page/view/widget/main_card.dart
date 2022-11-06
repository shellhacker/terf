import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/controller/home%20_data_getting_controller.dart';
import 'package:terf/screens/home_page/view/product_details.dart';
import 'package:terf/widgets/comment_text.dart';
import 'package:terf/widgets/const.dart';

import '../../controller/product_details.dart';

class Maincard extends StatelessWidget {
  const Maincard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailsController =
        Provider.of<ProductDetailsController>(context);
    return Consumer<NearestDataGetController>(builder: (context, value, _) {
      return value.isLoading
          ? const CircularProgressIndicator()
          : LimitedBox(
              maxHeight: 200,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: value.datas.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            productDetailsController
                                .getImages(value.datas[index]);

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                      turfDetails: value.datas[index],
                                    )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 133, 155, 155),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.network(
                                value.datas[index].turfImages!.turfImages1!
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 10,
                          child: CommnText(
                            fontSize: 20,
                            color: kWhite,
                            fontweight: FontWeight.bold,
                            title: value.datas[index].turfName!,
                          ),
                        ),
                        Positioned(
                            right: 10,
                            child: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.favorite_border_rounded))),
                      ]),
                    );
                  }),
            );
    });
  }
}
