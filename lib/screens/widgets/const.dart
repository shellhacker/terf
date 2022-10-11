import 'package:flutter/material.dart';

const kwidth5 = SizedBox(
  width: 5,
);
const kwidth10 = SizedBox(
  width: 10,
);
const kwidth20 = SizedBox(
  width: 20,
);
const kwidth30 = SizedBox(
  width: 30,
);
const kwidth40 = SizedBox(
  width: 40,
);
const kwidth50 = SizedBox(
  width: 50,
);

const kheight5 = SizedBox(
  height: 5,
);

const kheight10 = SizedBox(
  height: 10,
);
const kheight20 = SizedBox(
  height: 20,
);
const kheight30 = SizedBox(
  height: 30,
);
const kheight40 = SizedBox(
  height: 40,
);
const kheight50 = SizedBox(
  height: 50,
);

const textFormTextStyle = TextStyle(
  color: Colors.black45,
  fontSize: 15,
);
const TextStyle textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final boxDecoration = BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.circular(30),
);

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(15),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(60),
    );

//-------------------- Api Url //----------------

const baseUrl =
// ' http://localhost:3000/account/';
    'https://bkplaytime.herokuapp.com/';

// 'http://10.0.2.2:3000/account/';
const signupUrl = 'account/signup-email';
const emailOtpUrl = 'account/verify-email-otp';
const loginUrl = 'account/login-email';
const mobileOtp = 'account/verify-number-otp';

// lQIk6ISJzDZrJ6bY

//
const locationUrl = '';

const getHomeDataApi = 'https://fauxspot.herokuapp.com/user/all-turf';
