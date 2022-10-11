import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/home_page/view/product_details.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';
import 'package:terf/screens/widgets/const.dart';

import '../controller/home _data_getting_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key, this.visibility}) : super(key: key);
  bool? visibility = true;

  @override
  Widget build(BuildContext context) {
    final singupController = Provider.of<SignupController>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final locationCOntroller =
      //     Provider.of<LocationController>(context, listen: false);
      // locationCOntroller.getcurrentLocation();

      final homeDataGet =
          Provider.of<HomeDataGetController>(context, listen: false);
      homeDataGet.getTurfData();
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

              // CarouselSilderWidget(),

              kheight10,
              Expanded(
                child: AnimationLimiter(
                  child: Consumer<HomeDataGetController>(
                      builder: (context, value, child) {
                    return MasonryGridView.count(
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
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      )),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: GestureDetector(
                                          child: const CircleAvatar(
                                            radius: 80,
                                          ),
                                        ),
                                      ),
                                      kheight20,
                                      Text('fkhfkd'),
                                      // Text(value.datas.data![0].turfName ??
                                      // 'Invatiled Name'),
                                      kheight10,
                                      const Text('Thrissur'),
                                      // Visibility(
                                      // child:
                                      kheight5,
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
                                        onPressed: () {
                                          Navigator.push(
                                              BuildContext,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetails()));
                                        },
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
                        });
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

class SliversBasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //pinned: true,
          floating: false,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Basic Slivers'),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildListDelegate([
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: Text('orange $index'),
              );
            },
            childCount: 9,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 30,
          ),
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 200.0,
          //   mainAxisSpacing: 10.0,
          //   crossAxisSpacing: 10.0,
          //   childAspectRatio: 4.0,
          // ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.0,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8.0),
            child: Text('Grid Header', style: TextStyle(fontSize: 24)),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
          children: <Widget>[
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.blue),
          ],
        ),
        SliverGrid.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
          children: <Widget>[
            Container(color: Colors.pink),
            Container(color: Colors.indigo),
            Container(color: Colors.orange),
            Container(color: Colors.pink),
            Container(color: Colors.indigo),
            Container(color: Colors.orange),
          ],
        ),
      ],
    );
  }
}
