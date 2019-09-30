import 'package:flutter/material.dart';
import 'package:quizapp/rootpage.dart';
import 'auth/authentication.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'question_screen.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget{
  QuizAppState createState() => QuizAppState();
}
class QuizAppState extends State<QuizApp>{

  static const primarySwatch = Colors.purple;
  // button color
  static const buttonColor = Colors.purple;
  // app name
  static const appName = 'My App';
  // boolean for showing home page if user unverified
  static const homePageUnverified = false;

  final params = {
    'appName': appName,
    'primarySwatch': primarySwatch,
    'buttonColor': buttonColor,
    'homePageUnverified': homePageUnverified,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      initialRoute: '/',
      routes: {
        '/splash_screen': (context) => SplashScreenState(),
        '/home': (context) => HomeScreen(),
      },
      //For animation SLideLeftRoute
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/menu':
      //       return SlideRightRoute(widget:MenuPageState());
      //       break;
      //     case '/changepassword':
      //     return SlideRightRoute(widget:ChangePasswordPageState());
      //       break;
      //   }
      // },
      theme: ThemeData(
        primarySwatch: params['primarySwatch'],
      ),
      home: RootPage(params: params, auth: new Auth()),
    );
  }
}