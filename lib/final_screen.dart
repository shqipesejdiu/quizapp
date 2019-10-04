import 'package:flutter/material.dart';
import 'home_screen.dart';

class FinalScreenState extends StatefulWidget{
  final int countQuestions;
  FinalScreenState({Key key, @required this.countQuestions}) : super(key: key);
  FinalScreen createState() => FinalScreen();
}
class FinalScreen extends State<FinalScreenState>{

  showAppBar(){
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(left: 20),
        height: 170,
        // alignment: Alignment.center,
        color: Colors.purple,
        child: Row(
          children: <Widget>[
            Image.asset("images/person.png", width: 60,),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Shqipe Sejdiu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )),
                  Text("Score: 80 points",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )),
                ],
              ),
            ),
            //Image for question number and a circle
          ],
        ),
      ),
    );
  }

  showBottomNavigationBar(){
    return Container(
      height: 70,
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
                color: Colors.purple,
                alignment: Alignment.center
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.fromLTRB(20,0,20,0),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.cached,size: 45,color: Colors.transparent),
                        Text("Change Question",
                            style: TextStyle(
                              color: Colors.transparent,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => new HomeScreen(),
                              ),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(width: 2,color: Colors.purple[800]),right: BorderSide(width: 2,color: Colors.purple[800])),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home,size: 45,color: Colors.white),
                              Text("Home",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      )
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.schedule,size: 45,color: Colors.transparent),
                        Text("sesdsd",
                            style: TextStyle(
                              color: Colors.transparent,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              showAppBar(),
              Positioned(
                top: 200,
                left: 100,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Text("THANK YOU"),
                      Text("YOU HAVE: ${widget.countQuestions} correct answers"),
                      Text("YOU WON: ${widget.countQuestions *2} point"),
                    ],
                  ),
                  )
              )
            ],
          ),
        ),
        bottomNavigationBar: showBottomNavigationBar(),
      ),
    );
  }
}