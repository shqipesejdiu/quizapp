import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class ForgotPasswordPageState extends StatefulWidget{
  ForgotPasswordPage createState() => ForgotPasswordPage();
}
class ForgotPasswordPage extends State<ForgotPasswordPageState>{
  final _formKey = GlobalKey<FormState>();
  final FocusNode _password = FocusNode();
  final FocusNode _phoneNumber = FocusNode();
  String password = "";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SwipeDetector(
        onSwipeRight: (){
          Navigator.pop(context, false);
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(30,0,30,0),
          decoration: new BoxDecoration(
            color: Colors.purple[500]
          ), 
          child: Column(
            children: <Widget>[
              new Expanded(
                child: Center(),
              ),
              new Text("Forgot Password",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
              )),
              new Padding(padding: EdgeInsets.all(20)),
              new Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  shrinkWrap: true,
                  children: <Widget>[
                    new Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            new TextFormField(
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              focusNode: _phoneNumber,
                              validator: (value){
                                phoneNumber = value;
                              },
                              decoration: InputDecoration(
                                hintText: '+964 Phone Number',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                          ],
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                    new Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.fromLTRB(0,20,0,20),
                      child: GestureDetector(
                        child: Text("Get Password",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                        onTap: (){
                          if(_formKey.currentState.validate()){
                          }
                        },
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10)),            
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black,
            blurRadius: 20.0, 
            spreadRadius: 5.0,
            offset: Offset(
              10.0, 
              10.0, 
            ),
          ),],
        ),
        height: 100,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/services");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("images/services_icon.png", width: 50),
                  new Text("Services")
                ],
              )
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/home");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("images/home_icon.png",width: 50),
                  new Text("Home")
                ],
              )
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "/profile");
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("images/signin.png",width: 50),
                  new Text("Login")
                ],
              )
            ),
          ],
        ),
        ),
    );
  }
}