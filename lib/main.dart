import 'dart:ffi';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:railline/Pages/Homepage.dart';
import 'package:railline/Pages/Nagivagtion.dart';
import 'package:railline/Pages/Profile.dart';
import 'package:railline/utils/routs.dart';
import 'package:railline/utils/shared.dart';
import 'Pages/LoginPage.dart';
import 'Pages/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await Firebase.initializeApp();
  runApp(RailLine());
  runApp(const RailLine());
}

class RailLine extends StatefulWidget {
  const RailLine({Key? key}) : super(key: key);

  @override
  State<RailLine> createState() => _RailLineState();
}

class _RailLineState extends State<RailLine> {
  var isLogin;

  checkUserLoginState() async {
    await Shared.getUserSharedPrefernces().then(
      (value) {
        setState(() {
          isLogin = value;
        });
      },
    );
  }

  void iniState() {
    checkUserLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RailLine',
      themeMode: ThemeMode.light,
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
       initialRoute: FirebaseAuth.instance.currentUser != null
          ? '/Navigation'
          : '/LoginPage',
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.sampleRoute: (context) => Homepage(),
        MyRoutes.ProfileRoute: (context) => Profile(),
        MyRoutes.NavigationRoute:(context) => Navigation()
      },
    );
  }
}
