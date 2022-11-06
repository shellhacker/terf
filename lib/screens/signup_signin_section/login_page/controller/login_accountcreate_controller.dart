import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terf/screens/signup_signin_section/login_page/model/login_accountcreate_model.dart';
import 'package:terf/screens/signup_signin_section/signup_screen/controller/signup_accountcreate_controller.dart';

import '../../../home_page/view/homepage.dart';
import '../services/login_service.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loginpage = false;

  loginUser(context) async {
    final signupControllerProvider =
        Provider.of<SignupController>(context, listen: false);

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Enter valied Data')));
    } else {
      loginpage = true;
      LoginModel value = LoginModel(userMail: email, userPassword: password);
      GetAllTimeSlot? loginRespoModel =
          await LoginService.instance.userLogin(value, context);
      if (loginRespoModel!.status == true) {
        signupControllerProvider.saveToSharedPref();
        getToken(loginRespoModel);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else if (loginRespoModel.message == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Value is null')));
      } else {
        print(loginRespoModel.message);
      }
    }
  }

  getToken(GetAllTimeSlot value) async {
    await secureStorage.write(key: 'Token', value: value.token);
    await secureStorage.write(key: 'refreshToken', value: value.refreshToken);
    await secureStorage.write(key: 'loginTrue', value: 'true');
  }
}
