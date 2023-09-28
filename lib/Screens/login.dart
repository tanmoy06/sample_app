import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/Screens/homepage.dart';

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
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
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
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: pass);
                // ignore: unnecessary_null_comparison
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
    );
  }
}
