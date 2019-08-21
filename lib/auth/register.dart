import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class SignUpPageState extends StatefulWidget{
  SignUpPage createState() => SignUpPage();
}
class SignUpPage extends State<SignUpPageState>{
  final _formKey = GlobalKey<FormState>();
  final FocusNode _password = FocusNode();
  final FocusNode _phoneNumber = FocusNode();
  final FocusNode _firstName = FocusNode();
  final FocusNode _lastName = FocusNode();
  final FocusNode _email = FocusNode();
  final FocusNode _location = FocusNode();
  final FocusNode _confirmPassword = FocusNode();
  String password = "";
  String phoneNumber = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String location = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  SwipeDetector(
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
                flex: 1,
                child: Center(),
              ),
              new Text("Register",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
              )),
              new Padding(padding: EdgeInsets.all(20)),
              new Expanded(
                flex: 5,
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
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white, 
                              focusNode: _firstName,
                              validator: (value){
                                firstName = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'First Name',
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
                            new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            new TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white, 
                              focusNode: _lastName,
                              validator: (value){
                                lastName = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Last Name',
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
                            new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            new TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white, 
                              focusNode: _email,
                              validator: (value){
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Email',
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
                            new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            new Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Colors.white),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: new DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("A",style: TextStyle(color: Colors.white)),
                                style: TextStyle(color: Colors.black),
                                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    value = value; 
                                  });
                                },
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
                            new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            new TextFormField(
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white, 
                              focusNode: _confirmPassword,
                              validator: (value){
                                confirmPassword = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
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
                        child: Text("Register",
                          style: TextStyle(
                            fontSize: 17,
                          )),
                        onTap: (){
                          if(_formKey.currentState.validate()){
                          }
                        },
                      ),
                    ),
                    new Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  ],
                ),
              ),
            ],
          ),
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