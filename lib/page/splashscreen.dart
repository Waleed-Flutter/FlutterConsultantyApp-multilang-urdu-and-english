import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/login.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();
    }));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: 
           Padding(
             padding: const EdgeInsets.only(top: 330,bottom: 30),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  Text('Version 1.0',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A5B74),
                  ),
                  ),
               ],
             ),
           ),
    );
  }
}