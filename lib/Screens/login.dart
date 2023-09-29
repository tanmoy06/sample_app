import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Screens/homepage.dart';
import 'package:sample_app/Style/bg-style.dart';
import 'package:sample_app/Style/glossy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.blue[100],
      body: Stack(
        children: [
          const BackgroundStyle(
            LowerCircleColor1: Colors.yellow,
            LowerCircleColor2: Colors.orange,
            UpperCircleColor1: Colors.red,
            UpperCircleColor2: Colors.yellowAccent,
          ),
          Center(
            child: GlossyCard(
              borderRadius: 10.0,
              borderWith: 0.3,
              height: Get.height * .75,
              width: Get.width * .88,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: const TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.none),
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.transparent,
                        hintText: "Enter your Email",
                        hintStyle: const TextStyle(color: Colors.white60),
                        prefixIcon: const Icon(
                          Icons.email_rounded,
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        pass = value;
                      },
                      obscureText: true,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.none),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white60,
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.transparent,
                        hintStyle: const TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: pass);

                        if (user != null) {
                          Get.to(HomePage());
                        }
                      } catch (e) {
                        print(e);
                      }
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
