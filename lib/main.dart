import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart';
import 'auth/forgot_password.dart';
import 'question_screen.dart';
void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget{
  QuizAppState createState() => QuizAppState();
}
class QuizAppState extends State<QuizApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      initialRoute: '/',
      routes: {
        '/splash_screen': (context) => SplashScreenState(),
        '/home': (context) => HomeScreenState(),
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
        primarySwatch: Colors.blue,
      ),
      home: QuestionScreenState(),
    );
  }
}