import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sample_app/home_page.dart';
import 'package:sample_app/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  // ignore: non_constant_identifier_names
  static String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIN = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIN != null) {
        if (isLoggedIN) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    });
  }
}
