  import 'package:flutter/material.dart';
import 'RadialProgress/pointer.dart';

class FinalScreenState extends StatefulWidget{
  FinalScreen createState() => FinalScreen();
}
class FinalScreen extends State<FinalScreenState>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                alignment: Alignment.center,
                color: Colors.purple,
                child: Row(
                  children: <Widget>[
                    Image.asset("imageofUser"),
                    Column(
                      children: <Widget>[
                        Text("User-Name"),
                        Text("User-points"),
                      ],
                    ),
                    //Image for question number and a circle 
                    Expanded(
                      child: HomeContent(),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text("THANK YOU"),
                    Text("You have won: 10 points"),
                  ],
                ),
              ),
          ])),
        bottomNavigationBar: Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.fromLTRB(20,0,20,0),
            decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.asset("changeQuestion"),
                      Text("Change Question"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 1,color: Colors.grey),right: BorderSide(width: 1,color: Colors.grey)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset("removeOne"),
                      Text("Remove One"),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.asset("asdsad"),
                      Text("se"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}