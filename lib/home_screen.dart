import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'api/questions_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/authentication.dart';

class HomeScreen extends StatefulWidget{
  final Map params;
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  HomeScreen({Key key, this.params, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  HomeScreenState createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<SharedPreferences> sprefs = SharedPreferences.getInstance();

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  void setNumber(data) async{
    final prefs = await sprefs;
    prefs.setString("countQuestions", data);
  }

  final databaseReference = FirebaseDatabase.instance.reference();
  void createRecord(){

  }

  //Widgets
  Widget showAppBar() {
    return new Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(left: 20),
        height: 170,
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("images/person.png",width: 60,),
                Padding(
                  padding: EdgeInsets.fromLTRB(20,0,0,0),
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
              ],
            ),
            new FlatButton(
              child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white
              )),
              onPressed: signOut
            )
          ],
        ),
      ),
    );
  }

  Widget showBottomNavigationBar(){
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
    return Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              showAppBar(),
              Container(
                  alignment: Alignment.center,
                  child: FutureBuilder<QuestionList>(
                    future: fetchQuestions(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        List<Question> questions = snapshot.data.questions;
                        return RaisedButton(
                          padding: EdgeInsets.fromLTRB(40,15,40,15),
                          color: Colors.purple[700],
                          child: Text("START QUIZ",
                            style: TextStyle(
                                fontFamily: "Inconsolata",
                              color: Colors.white,
                              fontSize: 20
                            )),
                          onPressed: (){
//                            createRecord();
                            print("questionID: ${questions.first.id}");
                            print("questionsLength: ${questions.length}");
                            setNumber(questions.length.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => new QuestionScreenState(question:questions.first),
                              ),
                            );
                          },
                        );
                      }else if(snapshot.hasError){
                        return Container();
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),

              )
            ],
          ),
        ),
        bottomNavigationBar: showBottomNavigationBar(),
    );
  }
}