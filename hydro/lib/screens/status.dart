import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
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
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 30.0, right: 5),
          color: Color.fromARGB(255, 254, 253, 253),
          child: RotatedBox(
            quarterTurns: -1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedProgressBar(
                    //style: RoundedProgressBarStyle(
                    //borderWidth: 0,
                    //widthShadow: 0),
                    margin: EdgeInsets.symmetric(vertical: 16),
                    borderRadius: BorderRadius.circular(24),
                    childCenter: Text("5 Weaks"),
                    milliseconds: 1000,

                    //percent: percent,
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text('Plant Growth',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        child: Column(
                          children: [
                            CircularViewer(
                              value: 83,
                              maxValue: 100,
                              radius: 65,
                              textStyle: TextStyle(fontSize: 30),
                              color: Color.fromARGB(255, 248, 247, 247),
                              sliderColor: Color.fromARGB(255, 244, 233, 115),
                              unSelectedColor: Color(0xffD7DEE7),
                            ),
                            Text('Fertilizer Level in Liquid',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),

                  //Column(children: [Text("Temperature")]),
                ], //children
              ),
            ),
          ),

          // alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
