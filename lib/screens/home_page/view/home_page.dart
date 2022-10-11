import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terf/screens/home_page/view/widget/static_cardt.dart';
import 'package:terf/screens/widgets/const.dart';

class HomeView extends StatelessWidget {
  static String id = "Home_view";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of<HomeViewModel>(context, listen: false)
      // .getTurfDetails(context);
    });
    // HomeViewModel homeProvider = context.watch<HomeViewModel>();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on, color: Colors.black),
                    label:
                        // getUserLoction.userDetails == null     ?
                        const Text("select current location"
                            //         overflow: TextOverflow.ellipsis,
                            )
                    //     : Text(
                    //         getUserLoction.userDetails.toString(),
                    //         overflow: TextOverflow.ellipsis,
                    //         softWrap: false,
                    //         style: const TextStyle(color: Colors.black),
                    //       ),
                    ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  CupertinoSearchTextField(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  kheight20,
                  StaticCard(size: size),
                  kheight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nearby Grounds",
                        // style: textStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, BottomNavView.id);
                        },
                        child: Text(
                          "view All",
                          style: textStyle.copyWith(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  kheight5,
                  Container(
                    decoration: boxDecoration.copyWith(
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        // ChoiceChipWidget(
                        //   onClick: (bool value) {
                        //     homeProvider.setState("5's");
                        //   },
                        //   selected: homeProvider.type == "5's" ? true : false,
                        //   text: "5's",
                        //   textStyle: textStyle.copyWith(
                        //       fontSize: 18, color: whiteColor),
                        // ),
                        // ChoiceChipWidget(
                        //   onClick: (bool value) {
                        //     homeProvider.setState("6's");
                        //   },
                        //   selected: homeProvider.type == "6's" ? true : false,
                        //   text: "6's",
                        //   textStyle: textStyle.copyWith(
                        //       fontSize: 18, color: whiteColor),
                        // ),
                        // ChoiceChipWidget(
                        //   onClick: (bool value) {
                        //     homeProvider.setState("7's");
                        //   },
                        //   selected: homeProvider.type == "7's" ? true : false,
                        //   text: "7's",
                        //   textStyle: textStyle.copyWith(
                        //       fontSize: 18, color: whiteColor),
                        // ),
                        // ChoiceChipWidget(
                        //   onClick: (bool value) {
                        //     homeProvider.setState("9's");
                        //   },
                        //   selected: homeProvider.type == "9's" ? true : false,
                        //   text: "9's",
                        //   textStyle: textStyle.copyWith(
                        //       fontSize: 18, color: whiteColor),
                        // ),
                        // ChoiceChipWidget(
                        //   onClick: (bool value) {
                        //     homeProvider.setState("11's");
                        //   },
                        //   selected: homeProvider.type == "11's" ? true : false,
                        //   text: "11's",
                        //   textStyle: textStyle.copyWith(
                        //       fontSize: 18, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kheight5,
            // Expanded(
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            //     child: Consumer<HomeDataGetController>(
            //       builder: (context, value, child) {
            //         return GridView.builder(
            //           physics: const BouncingScrollPhysics(),
            //           itemCount: value.turfDetails.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             mainAxisSpacing: 20,
            //             crossAxisSpacing: 20,
            //             childAspectRatio: MediaQuery.of(context).size.width /
            //                 (MediaQuery.of(context).size.height / 1.2),
            //           ),
            //           itemBuilder: (context, index) {
            //             final newTurf = value.turfDetails[index];
            //             return TurfContainer(
            //               turfName: newTurf.turfName,
            //               turfPlace: newTurf.turfPlace,
            //               visible: false,
            //               turfImage: newTurf.turfImages.turfImages1!,
            //               cardOnTap: () {
            //                 // Navigator.pushNamed(context, DetailsView.id);
            //               },
            //               bookOnclick: () {},
            //             );
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
