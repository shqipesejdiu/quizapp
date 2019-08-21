import 'package:flutter/material.dart';
import 'register.dart';
import 'forgot_password.dart';

class SignInPageState extends StatefulWidget{
  SignInPage createState() => SignInPage();
}
class SignInPage extends State<SignInPageState>{
  final _formKey = GlobalKey<FormState>();
  final FocusNode _password = FocusNode();
  final FocusNode _phoneNumber = FocusNode();
  String password = "";
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  Container(
        padding: EdgeInsets.fromLTRB(30,0,30,0),
        decoration: new BoxDecoration(
          color: Colors.purple[500],
          ), 
        child: Column(
          children: <Widget>[
            new Expanded(
              child: Center(),
            ),
            new Text("Sign In",
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
                          new TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white, 
                            focusNode: _password,
                            validator: (value){
                              password = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
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
                  new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  new Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.fromLTRB(0,20,0,20),
                    child: GestureDetector(
                      child: Text("Sign in",
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
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordPageState()
                        )  
                      );
                    },
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text("Forgot Password? ",
                          style: TextStyle(
                          color: Colors.white
                        )),
                        new Text("Click Here",
                          style: TextStyle(
                          color: Colors.yellow
                        )),
                      ],
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPageState(),
                        ),
                      );
                    },
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text("Don't have an Account? ",
                          style: TextStyle(
                          color: Colors.white
                        )),
                        new Text("Sign Up Now",
                            style: TextStyle(
                            color: Colors.yellow
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                top: 0,
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
    );
  }
}