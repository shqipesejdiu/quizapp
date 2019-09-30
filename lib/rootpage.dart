import 'package:flutter/material.dart';
import 'package:quizapp/home_screen.dart';
import 'auth/authentication.dart';
import 'auth/login_signup.dart';

class RootPage extends StatefulWidget{

  final BaseAuth auth;
  final Map params;
  RootPage({this.params, this.auth});
  @override
  State<StatefulWidget> createState() => new RootPageState();
}

enum AuthStatus{
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}
class RootPageState extends State<RootPage>{

  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user){
      setState(() {
        if(user != null){
          userId = user?.uid;
        }
        authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void onLoggedIn(){
    widget.auth.getCurrentUser().then((user){
      setState(() {
        userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }
  void onSignedOut(){
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      userId = "";
    });
  }
  Widget waitingScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.NOT_LOGGED_IN:
        return LoginSignUp(
          auth: widget.auth,
          onSignedIn: onLoggedIn,
          params: widget.params,
        );
        break;

      case AuthStatus.LOGGED_IN:
        if (userId.length > 0 && userId != null) {
          return new HomeScreen(
            userId: userId,
            auth: widget.auth,
            onSignedOut: onSignedOut,
            params: widget.params,
          );
        } else return waitingScreen();
        break;

      default:
        return waitingScreen();
    }
  }
}