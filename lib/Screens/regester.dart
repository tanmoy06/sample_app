import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sample_app/Controller/fire_auth.dart';
import 'package:sample_app/Screens/homepage.dart';
import 'package:sample_app/Style/bg-style.dart';
import 'package:sample_app/Style/glossy.dart';

class Regester extends StatefulWidget {
  const Regester({super.key});

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  final _auth = FirebaseAuth.instance;
  // late String email;
  // late String pass;
  AuthController _authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[100],
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
                      // onChanged: (value) {
                      //   emailController.text = value;
                      // },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Enter your Email",
                        hintStyle: const TextStyle(color: Colors.white60),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white60,
                        ),
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // onChanged: (value) {
                      //   passController.text = value;
                      // },
                      controller: passController,
                      obscureText: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white60),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white60,
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _authController.createUserWithEmailAndPassword(
                          emailController.text, passController.text);
                      if (_authController.user.value != null) {
                        Get.to(() => const HomePage());
                      }
                    },
                    // () async {
                    //   try {
                    //     final newUser =
                    //         await _auth.createUserWithEmailAndPassword(
                    //             email: emailController.text,
                    //             password: passController.text);

                    //     if (newUser != null) {
                    //       Get.to(() => const HomePage());
                    //     }
                    //   } catch (e) {
                    //     print(e);
                    //   }
                    // },
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
                          'Submit',
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
