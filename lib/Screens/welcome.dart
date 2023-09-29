import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Screens/login.dart';
import 'package:sample_app/Screens/regester.dart';
import 'package:sample_app/Style/bg-style.dart';
import 'package:sample_app/Style/glossy.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BackgroundStyle(
            LowerCircleColor1: Colors.red,
            LowerCircleColor2: Colors.yellow,
            UpperCircleColor1: Colors.yellow,
            UpperCircleColor2: Colors.red,
          ),
          Center(
            child: GlossyCard(
              borderRadius: 10.0,
              borderWith: 0.3,
              height: Get.height * .75,
              width: Get.width * .88,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WallPaper',
                    style: TextStyle(
                        fontFamily: 'HandWritten',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.teal[800],
                        ),
                        child: const Center(
                            child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 25.0),
                        )),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const Regester());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.teal[800],
                        ),
                        child: const Center(
                            child: Text(
                          'Regester',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 25.0),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
