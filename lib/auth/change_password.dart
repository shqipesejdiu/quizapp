import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
class ChangePasswordPageState extends StatefulWidget{
  ChangePasswordPage createState() => ChangePasswordPage();
}
class ChangePasswordPage extends State<ChangePasswordPageState>{
  final _formKey = GlobalKey<FormState>();
  final FocusNode _password = FocusNode();
  final FocusNode _newPassword = FocusNode();
  String password = "";
  String newPassword = "";

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
            // image: new DecorationImage(
            //   image: new AssetImage('images/background_welcome.png'),
            //   fit: BoxFit.fill,
            // ),
            color: Colors.purple[500]
          ), 
          child: Column(
            children: <Widget>[
              new Expanded(
                child: Center(),
              ),
              new Text("Change Password",
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
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              focusNode: _newPassword,
                              validator: (value){
                                newPassword = value;
                                if(value.isEmpty){
                                  return "Please enter your password";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
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
                            new Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            new TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white, 
                              focusNode: _password,
                              validator: (value){
                                password = value;
                                if(value.isEmpty){
                                  return "Please enter your new Password";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'New Password',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide(width: 1, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                    new ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(0,20,0,20),
                        textColor: Colors.black,
                        color: Colors.yellow,
                        child: Text("Change Password",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                          }
                        },
                      ),
                    ),
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
                  new Text("Profile")
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}