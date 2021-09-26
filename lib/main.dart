

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      title: 'WIFI-Symbol-Animation',
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController firstController;
  Animation<double> firstAnimation;

  AnimationController secondController;
  Animation<double> secondAnimation;

  AnimationController thirdController;
  Animation<double> thirdAnimation;

  AnimationController fourthController;
  Animation<double> fourthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    firstAnimation = Tween<double>(begin: .37, end: .3).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    secondAnimation = Tween<double>(begin: .5, end: .41).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    thirdAnimation = Tween<double>(begin: .63, end: .52).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    fourthAnimation = Tween<double>(begin: .76, end: .63).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6101EB),
      body: Center(
        child: CustomPaint(
          painter: DrawPath(
            firstAnimation.value,
            secondAnimation.value,
            thirdAnimation.value,
            fourthAnimation.value,
          ),
          child: SizedBox(
            height: 250,
            width: 210,
          ),
        ),
      ),
    );
  }
}

class DrawPath extends CustomPainter {
  final double height1;
  final double height2;
  final double height3;
  final double height4;

  DrawPath(
      this.height1,
      this.height2,
      this.height3,
      this.height4,
      );

  @override
  void paint(Canvas canvas, Size size) {
    Color designColor = Color(0xffEAEEF0);

    Paint firstPaint = Paint()
      ..color = designColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25;

    Paint secondPaint = Paint()
      ..color = designColor
      ..style = PaintingStyle.fill;

    Path firstPath = Path();
    firstPath.moveTo(0, size.height * height1);
    firstPath.arcToPoint(
      Offset(size.width, size.height * height1),
      radius: Radius.circular(135),
    );

    canvas.drawPath(firstPath, firstPaint);

    Path secondPath = Path();
    secondPath.moveTo(size.width * .16, size.height * height2);
    secondPath.arcToPoint(
      Offset(size.width * .84, size.height * height2),
      radius: Radius.circular(90),
    );

    canvas.drawPath(secondPath, firstPaint);

    Path thirdPath = Path();
    thirdPath.moveTo(size.width * .33, size.height * height3);
    thirdPath.arcToPoint(
      Offset(size.width * .67, size.height * height3),
      radius: Radius.circular(43),
    );

    canvas.drawPath(thirdPath, firstPaint);

    canvas.drawCircle(
        Offset(size.width * .5, size.height * height4), 17, secondPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}