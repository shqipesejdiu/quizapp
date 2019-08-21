import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with TickerProviderStateMixin {

  double percentage = 0.0;
  double newPercentage = 0.0;
  AnimationController percentageAnimationController;

  @override
  void initState() {
    super.initState();
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
              child: new Text("10",style: TextStyle(color: Colors.white,fontSize: 19)),
              onPressed: (){
                setState(() {
                    percentage = newPercentage;
                    newPercentage += 10;
                    if(newPercentage>100.0){
                      percentage=0.0;
                      newPercentage=0.0;
                    }
                    percentageAnimationController.forward(from: 0.0);
                });

              }),
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