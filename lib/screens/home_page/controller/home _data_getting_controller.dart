import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terf/screens/home_page/model/home_model.dart';
import '../services/home_data_get_services.dart';

class HomeDataGetController extends ChangeNotifier {
  bool isLoading = false;
  TurfeMainDataModel? datas = TurfeMainDataModel();
  Future<TurfeMainDataModel?> getTurfData() async {
    isLoading = true;
    datas = await HomeDataGetServices.getData();
    print('return okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    print(datas.runtimeType);

    if (datas != null) {
      if (datas!.data != null) {
        // operations
        isLoading = false;
        return datas;
      } else if (datas!.status == false) {
        print(datas!.message);
      } else {}
    }
    return datas;
  }
}

// class Home {
//   final String city = "Portland";

//   Future<String> fetchAddress() {
//     final address = Future.delayed(Duration(seconds: 2), () {
//       return '1234 North Commercial Ave.';
//     });

//     return address;
//   }
// }

// // void main() {
// //   runApp(
// //     FutureProvider<String>(
// //       create: (context) => Home().fetchAddress(),
// //       initialData: "fetching address...",
// //       child: MyApp(),
// //     ),
// //   );
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child:
//                   Consumer<String>(builder: (context, String address, child) {
//                 return Text("address: $address");
//               }),
//             )));
//   }
// }
