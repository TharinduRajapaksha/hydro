import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        LiteRollingSwitch(
          value: true,
          textOn: 'disponible',
          textOff: 'ocupado',
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
    ));
  }
}
