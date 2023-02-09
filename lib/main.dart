
import 'package:arabicaa/BottumNav.dart';
import 'package:arabicaa/Cart.dart';
import 'package:arabicaa/Donuts.dart';
import 'package:arabicaa/HomePage.dart';
import 'package:arabicaa/HotCoffee.dart';
import 'package:arabicaa/IcedCoffee.dart';
import 'package:arabicaa/ItemView.dart';
import 'package:arabicaa/Payment.dart';
import 'package:arabicaa/Profile.dart';
import 'package:arabicaa/Register.dart';
import 'package:arabicaa/home_body.dart';
import 'package:arabicaa/loginScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {


  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/Reg': (context) => Register(),
        '/home': (context) => HomePage(),
        // '/Pay': (context) => Payement(),
        '/Pro': (context) => Profile(),

        // '/hot': (context) => Products(),
        '/ice': (context) => IcedCoffee(),
        '/don': (context) => Donuts(),
        // '/cart': (context) => ShopCart(),


      },
    );
  }
}



