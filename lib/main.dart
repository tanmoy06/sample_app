import 'package:flutter/material.dart';
// import 'package:sample_app/home_page.dart';
import 'package:get/get.dart';

import 'homepage.dart';
// import 'package:sample_app/splssh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ShadowsIntoLight',
      ),
      home: HomeScreen(),
    );
  }
}
