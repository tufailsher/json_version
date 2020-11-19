import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonversion/Screens/VersionScreen.dart';
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
             "Log In"
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.0),
                ),

                child: TextField(textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    //fillColor: Colors.white,
                    hintText: "Enter mail here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                      ),
                    )
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blueGrey,
                child: Text("next"),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=>VersionScreen(),
                ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
