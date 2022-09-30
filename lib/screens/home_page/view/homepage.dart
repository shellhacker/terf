import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final singupController = Provider.of<SignupController>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('sfgsdcsdg'),
            IconButton(
                onPressed: () {
                  singupController.clearSavedData(context);
                },
                icon: Icon(Icons.abc))
          ],
        ),
      ),
    );
  }
}
