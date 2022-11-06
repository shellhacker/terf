import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/searchscreen/view/search_screen.dart';
import 'package:terf/screens/home_page/view/widget/main_card.dart';
import 'package:terf/widgets/comment_text.dart';
import 'package:terf/widgets/commnbckgrnd_widget.dart';
import 'package:terf/widgets/const.dart';

import '../controller/home _data_getting_controller.dart';
import '../controller/location_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key, this.visibility}) : super(key: key);
  bool? visibility = true;

  @override
  Widget build(BuildContext context) {
    //final singupController = Provider.of<SignupController>(context);
    GetUserLoction location =
        Provider.of<GetUserLoction>(context, listen: false);
    final homeDataGet =
        Provider.of<NearestDataGetController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      location.getUserLocation();
      homeDataGet.getNearestTurfData();
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchPage())),
                icon: const Icon(Icons.search))
          ],
        ),
        body: CommnBckgndColor(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        location.getUserLocation();
                      },
                      icon: const Icon(
                        Icons.location_on,
                        color: kBlack,
                      ),
                      label: location.userDetails == null
                          ? const Text(
                              "select current location",
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              location.userDetails.toString(),
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: const TextStyle(color: Colors.black),
                            ),
                    ),
                  ],
                ),
                // ChoiceChip(
                //     label: const Text(''),
                //     onSelected: (newBoolValue) {
                //       homeDataGet.catogoryChoice(newBoolValue);
                //     },
                //     selected: homeDataGet.isSelected!),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    children: [
                      CommnText(
                        title: 'Trending Near You',
                        fontSize: 25,
                        fontweight: FontWeight.bold,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: CommnText(
                          title: 'View All',
                          color: kWhite,
                        ),
                      )
                    ],
                  ),
                ),
                const Maincard(),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Row(
                    children: [
                      CommnText(
                        title: 'Most Popular',
                        fontSize: 25,
                        fontweight: FontWeight.bold,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: CommnText(
                          title: 'View All',
                          color: kWhite,
                        ),
                      )
                    ],
                  ),
                ),
                const Maincard(),
              ]),
            ),
          ),
        ));
  }
}
