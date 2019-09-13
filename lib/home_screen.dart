import 'package:flutter/material.dart';
import 'api/questions_api.dart';

class HomeScreenState extends StatefulWidget{
  HomeScreen createState() => HomeScreen();
}
class HomeScreen extends State<HomeScreenState>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // width: MediaQuery.of(context).size.width,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
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
                      Image.asset("images/person.png",width: 60,),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20,0,0,0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("User-Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                )),
                            Text("User-points",
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
              ),

              Positioned(
//                alignment: Alignment.cen
              top: 200,
                left: 100,
                child: Container(
                  child: FutureBuilder<QuestionList>(
                    future: fetchQuestions(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        print("hasData");
                        List<Question> questions = snapshot.data.questions;
                        print(questions[0].answers.toString());
                        return RaisedButton(
                          child: Text("Start Quiz"),
                          onPressed: (){
                            print(questions[0].id.toString());
                          },
                        );
                      }else if(snapshot.hasError){
                        return Container();
                      }
                      return Container();
                    },
                  ),
                )
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
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
                            Icon(Icons.cached,size: 45,color: Colors.white),
                            Text("Change Question",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(width: 2,color: Colors.purple[800]),right: BorderSide(width: 2,color: Colors.purple[800])),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.school,size: 45,color: Colors.white),
                              Text("Remove One",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.schedule,size: 45,color: Colors.white),
                            Text("sesdsd",
                                style: TextStyle(
                                  color: Colors.white,
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
        ),
      ),
    );
  }
}