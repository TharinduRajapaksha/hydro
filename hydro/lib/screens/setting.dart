import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 30.0, bottom: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Liquid Pump   - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LiteRollingSwitch(
                          value: true,
                          textOn: 'Switch On',
                          textOff: 'Switch Off',
                          colorOn: Colors.greenAccent[700],
                          colorOff: Colors.redAccent[700],
                          iconOn: Icons.done,
                          iconOff: Icons.remove_circle_outline,
                          textSize: 16.0,
                          onChanged: (bool state) {
                            //Use it to manage the different states
                            print('Current State of SWITCH IS: $state');
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            Text("Fertilizer Tank",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              child: Row(
                children: [
                  Container(
                      height: 120,
                      width: 350,
                      margin: const EdgeInsets.only(right: 5, left: 5, top: 30),
                      child: Scaffold(
                          body: LiquidLinearProgressIndicator(
                        value: 0.37,
                        valueColor: AlwaysStoppedAnimation(
                            Color.fromARGB(255, 244, 233, 115)),
                        backgroundColor: Colors.white,
                        borderColor: Color.fromARGB(255, 246, 177, 92),
                        borderWidth: 5.0,
                        borderRadius: 12.0,
                        direction: Axis.vertical,
                        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                        center: Text("42%"),
                      )))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text('Manual Fertilizer Feed   -   ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 70,
                          width: 70,
                          child: Scaffold(
                            body: FloatingActionButton(
                              onPressed: () {
                                //action code for button 1
                              },
                              child: Icon(Icons.add),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
