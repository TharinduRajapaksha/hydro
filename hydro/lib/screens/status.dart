import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:hydro/navbar_key.dart';
import 'package:circular/circular.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RotatedBox(
          quarterTurns: -1,
          child: Container(
            color: Color.fromARGB(255, 254, 253, 253),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /*
                RoundedProgressBar(
                  //style: RoundedProgressBarStyle(
                  // borderWidth: 0,
                  //widthShadow: 0),
                  //margin: EdgeInsets.symmetric(vertical: 16),
                  borderRadius: BorderRadius.circular(24),
                  childCenter: Text("Weaks"),
                  milliseconds: 1000,
                  //percent: percent,
                )*/

                LinearPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 40,
                  percent: 0.5,
                  progressColor: Color.fromARGB(255, 13, 100, 212),
                  backgroundColor: Color(0xffD7DEE7),
                  //barRadius:

                  //clipLinearGradient: cir,
                ),
                //Column(children: [Text("Temperature")]),
              ], //children
            ),
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
