import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.blueGrey,
                      shape: BoxShape.rectangle),
                  height: 100,
                  width: 186,
                  child: Center(
                    child: Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.blueGrey,
                      shape: BoxShape.rectangle),
                  height: 100,
                  width: 186,
                  child: Center(
                    child: Text(
                      "Hello",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
