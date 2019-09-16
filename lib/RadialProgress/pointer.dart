import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
class CountQuestions extends StatefulWidget {
  final int questionId;
  CountQuestions({Key key, @required this.questionId}) : super(key: key);
  @override
  _CountQuestionsState createState() => _CountQuestionsState();
}

class _CountQuestionsState extends State<CountQuestions> with TickerProviderStateMixin {

  static double percentage = 0.0;
  static double newPercentage = 0.0;
  AnimationController percentageAnimationController;
  Future<SharedPreferences> sprefs = SharedPreferences.getInstance();
  int countQuestions;
  Future getNumber() async{
    final prefs = await sprefs;
    return prefs.getString("countQuestions");
  }
  @override
  void initState() {
    super.initState();
    getNumber().then((value){
      countQuestions = int.parse(value);
      pressedButton();
    });
    setState(() {
        percentage = 0.0;
    });
    percentageAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000)
    )
    ..addListener((){
      setState(() {
        percentage = lerpDouble(percentage,newPercentage,percentageAnimationController.value);
      });
    });
  }
  pressedButton(){
    setState(() {
      percentage = newPercentage;
      newPercentage += 100/countQuestions;
      if(newPercentage>100.0){
        percentage=0.0;
        newPercentage=0.0;
      }
      percentageAnimationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.centerRight,
      height: 150.0,
      width: 150.0,
      child: new CustomPaint(
        foregroundPainter: new MyPainter(
          lineColor: Colors.purple[900],
          completeColor: Colors.green,
          completePercent: percentage,
          width: 8.0
        ),
        child: new Padding(
          padding: const EdgeInsets.all(0.0),
          child: new RaisedButton(
            padding: EdgeInsets.all(20.0),
            color: Colors.purple[900],
            splashColor: Colors.green,
            shape: new CircleBorder(),
            child: new Text("${widget.questionId}",style: TextStyle(color: Colors.white,fontSize: 19)),

          ),
        ),
      ),
    );
  }
}
class MyPainter extends CustomPainter{

  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter({this.lineColor,this.completeColor,this.completePercent,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
        ..color = lineColor
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );

    double arcAngle = 2*pi* (completePercent/100);

    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}