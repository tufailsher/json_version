import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jsonversion/Provider/versionData.dart';
import 'package:provider/provider.dart';

import '../constants.dart';


class VersionScreen extends StatefulWidget {
  @override
  _VersionScreenState createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  String orderDate(DateTime date) {
    if (date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day)
      return 'Today @ ${DateFormat.jm().format(date)}';
    else if (date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day - 1)
      return 'Yesterday @ ${DateFormat.jm().format(date)}';
    else
      return '${kWeekdays[date.weekday - 1]}, ${date.day}'
          ' ${kMonths[date.month - 1]} @ ${DateFormat.jm().format(date)}';
  }
  int index=0;
  void dataLoading(){
    Provider.of<VersionData>(context,listen: false).loadVersions();
  }

  @override
  void initState() {
    super.initState();
    dataLoading();
  }
  @override
  Widget build(BuildContext context) {
    //Provider.of<VersionData>(context).getVersions=versions;
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.black,
          appBar:PreferredSize(
            child: Container(
             // color: Colors.black,
            child: Row(
              children:[
                Container(
                  margin: EdgeInsets.only(left: 20,right: 10),
                  height: 30,
                    width: 30,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("assets/EAD_icon.jpg")),
                ),
                Text("Eat's A Deal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              ],
            ),
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30),
              ),
            ),
          ),
              preferredSize: Size(300.0, 100.0),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text("Builds",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 350.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Consumer<VersionData>(
                      builder: (context,model,child){
                        return model.loading?Center(child: CircularProgressIndicator()):Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("new-login-ui",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              RichText(text:TextSpan(
                                text: "Version:  ",
                                children:<TextSpan> [
                                  TextSpan(
                                    text: "${model.vd[index].projectId.toString()}."
                                        "${model.vd[index].projectId.toString()}."
                                      "${model.vd[index].id.toString()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ],
                              )),
                              RichText(
                                text: TextSpan(text: "Updated: ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                  children: [
                                    TextSpan(
                                      text:"${orderDate(model.vd[index].uploaded)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )
                                    )
                                  ]
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          ),
    );
  }
}
