import 'package:flutter/cupertino.dart';
import 'package:terf/screens/searchscreen/view/search_screen.dart';

import '../../cart_screen/cart_page.dart';
import '../../home_page/view/homepage.dart';
import '../../profile_screen/profile_page.dart';

class BottumControllerScreen extends ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    Homepage(),
    const CartPageScreen(),
    const SearchPage(),
    const ProfileScreen(),
  ];

  onChange(index) {
    selectedIndex = index;
    notifyListeners();
  }
}
