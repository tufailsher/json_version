//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jsonversion/Provider/versionData.dart';
import 'package:provider/provider.dart';

import 'Screens/SplashScreen.dart';
void main(){
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>VersionData()),
  ],
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreen(),
    );
  }
}
