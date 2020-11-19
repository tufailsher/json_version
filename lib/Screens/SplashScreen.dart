import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jsonversion/Screens/LogIn.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  Future<bool> tempSession()async{
    await Future.delayed(Duration(milliseconds: 5000),(){});
    return true;

  }
  void navigateToLogin(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder:(BuildContext context)=> LogIn(),
      )
    );
  }
@override
  void initState() {
    super.initState();
    tempSession().then((value) => navigateToLogin());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("musa Usman and company",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Text("developers",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
