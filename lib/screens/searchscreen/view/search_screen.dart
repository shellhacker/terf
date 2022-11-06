import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/comment_text.dart';
import '../../../widgets/const.dart';
import '../../home_page/view/product_details.dart';
import '../controller/searchcontroller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController =
        Provider.of<SearchController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchController.getAllTurfData();
    });

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                controller: searchController.text,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        searchController.searchTurf(searchController.text.text);
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        searchController.text.clear();
                        searchController.tempList.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Consumer<SearchController>(builder: (context, value, _) {
        return value.isLoading
            ? const CircularProgressIndicator()
            : GridView.builder(
                padding: const EdgeInsets.all(8),
                // shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: value.tempList.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          )),
                      child: Column(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ImageDetailScreen(
                                      image: value.datas[index].turfImages!
                                          .turfImages1!,
                                    )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                            // child: const Text(''),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Hero(
                                tag: 'imageHero',
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  value.tempList[index].turfImages!.turfImages1
                                      .toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            kwidth10,
                            Expanded(
                              child: CommnText(
                                color: kBlack,
                                fontweight: FontWeight.bold,
                                title:
                                    value.tempList[index].turfName.toString(),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_rounded)),
                            ),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => ProductDetails(
                                                turfDetails:
                                                    value.datas[index])));
                                  },
                                  icon: const Icon(
                                      Icons.shopping_cart_checkout_outlined)),
                            ),
                          ],
                        ),
                      ]));
                });
      }),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  ImageDetailScreen({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            image,
          ),
        ),
      ),
    );
  }
}
