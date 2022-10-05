import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lottie/lottie.dart';
import 'package:railline/Pages/HomePages.dart';
import 'package:railline/Pages/SplashScreen.dart';
import 'package:railline/utils/routs.dart';
import 'package:railline/utils/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();

  Future<FirebaseApp>? _firebaseapp;
  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void inistate() {
    super.initState();
    _firebaseapp = Firebase.initializeApp();
  }

  moveToSplashScreen(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 255, 254, 254),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 350,
                  width: 350,
                  child: Lottie.asset('assets/animation/login.json'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome  $name",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder(
                    future: _firebaseapp,
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      return SingleChildScrollView(
                        child: Column(children: [
                          TextFormField(
                            controller: emails,
                            decoration: InputDecoration(
                                hintText: "Enter Email",
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                            // onChanged: (value) {
                            //   name = value;
                            //   setState(() {});
                            // },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: (String? value) {
                                if (value != null && value.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value!.length < 6) {
                                  return "Password need to be more than 6 digits";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 50.0,
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                setState(() {
                                  isLoading = true;
                                });
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: emails.text,
                                        password: password.text);
                                moveToSplashScreen(context);
                                setState(() {
                                  isLoading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                print('failed with error code: ${e.code}');
                                print(e.message);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'Incorrect Password Or Email'),
                                  ),
                                );
                              }
                              await Shared.getUserSharedPrefernces().then(
                                (value) {
                                  setState(() {
                                    var isLogin = value;
                                  });
                                },
                              );
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: changebutton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changebutton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 10, 129, 83),
                                borderRadius: BorderRadius.circular(
                                    changebutton ? 50 : 12),
                              ),
                            ),
                          ),
                        ]),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          //children
        ),
      ),
    );
  }
}
