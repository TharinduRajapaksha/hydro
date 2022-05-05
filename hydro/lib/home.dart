import 'package:flutter/material.dart';
import 'package:circular/circular.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(body: Center(child: Home())),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int angle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 254, 253, 253),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircularViewer(
                value: 50,
                maxValue: 100,
                radius: 75,
                textStyle: TextStyle(fontSize: 30),
                color: Color.fromARGB(255, 248, 247, 247),
                sliderColor: Color.fromARGB(255, 53, 183, 122),
                unSelectedColor: Color(0xffD7DEE7),
              ),
              const CircularViewer(
                value: 70,
                maxValue: 100,
                radius: 75,
                textStyle: TextStyle(fontSize: 30),
                color: Color.fromARGB(255, 248, 247, 247),
                sliderColor: Color.fromARGB(255, 1, 247, 255),
                unSelectedColor: Color(0xffD7DEE7),
              ),
              //const Text("kabvkjadb"),
            ], //children
          ),
          alignment: Alignment.topRight,
        ),
      ),
    );
  }
}
