import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sample_app/login_page.dart';
import 'package:sample_app/splssh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigationbar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  var emailTextController = TextEditingController();
  var passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      bottomNavigationBar: const Navigation(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 12,
                  height: 50,
                ),
                Text(
                  "App Name",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue[400],
                  ),
                ),
                const SizedBox(
                  width: 180,
                  height: 55,
                ),
                const Icon(
                  Icons.more_vert,
                  weight: 15,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'ShadowsIntoLight',
                color: Color.fromARGB(255, 5, 46, 151),
                fontSize: 45,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: emailTextController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  alignLabelWithHint: GetPlatform.isAndroid,
                  hintText: "Number/Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: passTextController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        // obsecureText:
                        // false;
                      },
                      icon: Icon(Icons.remove_red_eye)),
                  alignLabelWithHint: GetPlatform.isAndroid,
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      35,
                    ),
                  ),
                ),
              ),
            ),

// SUBMIT BUTTON-------------------------------------------

            ElevatedButton(
              onPressed: () async {
                //if successfully Logged in
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashState.KEYLOGIN, true);
                // String uEmail = emailTextController.text.toString();
                // String uPass = passTextController.text;

                // print("Email: $uEmail, Pass: $uPass");

                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
                // Get.to(() => Login());
              },
              child: const Text(
                "Login",
              ),
            )
          ],
        ),
      ),
    );
  }
}
