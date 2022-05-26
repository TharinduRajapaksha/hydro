import 'package:flutter/material.dart';
import 'package:circular/circular.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart'
    as sfp2; //i put sfp2 for solve the conflict between two syncfusion imports

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
  /////////////// bellow for real time chart//////////
  late List<LiveData> chartData;
  //late List<LiveData> chartData2; //second line
  late ChartSeriesController _chartSeriesController;
  //late ChartSeriesController _chartSeriesController2;

  /////////////////chart speed handle here//////////////
  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 5), updateDataSource);
    super.initState();
  }

  /*//second line
  void initState2() {
    chartData2 = getChartData2();
    Timer.periodic(const Duration(seconds: 5), updateDataSource2);
    super.initState();
  }*/

  int angle = 0; //bottom navigation bar variable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
////////////////////////////////Gauge start here////////////////////////////////////////
            Container(
              color: Color.fromARGB(255, 254, 253, 253),
              margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //width: 50,
                    //height: 350,
                    child: Column(
                      children: [
                        /*
                        sfp2.SfRadialGauge(axes: <sfp2.RadialAxis>[
                          sfp2.RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: sfp2.AxisLineStyle(
                              thickness: 0.2,
                              cornerStyle: sfp2.CornerStyle.bothCurve,
                              color: Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: sfp2.GaugeSizeUnit.factor,
                            ),
                            pointers: <sfp2.GaugePointer>[
                              sfp2.RangePointer(
                                value: sfp2.progressValue,
                                cornerStyle: sfp2.CornerStyle.bothCurve,
                                width: 0.2,
                                sizeUnit: sfp2.GaugeSizeUnit.factor,
                              )
                            ],
                          )
                        ]),*/

                        const CircularViewer(
                          value: 32,
                          maxValue: 100,
                          radius: 65,
                          textStyle: TextStyle(fontSize: 30),
                          color: Color.fromARGB(255, 248, 247, 247),
                          sliderColor: Color.fromARGB(255, 53, 183, 122),
                          unSelectedColor: Color(0xffD7DEE7),
                        ),
                        Text('Temperature C',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const CircularViewer(
                        value: 22,
                        maxValue: 100,
                        radius: 65,
                        textStyle: TextStyle(fontSize: 30),
                        color: Color.fromARGB(255, 248, 247, 247),
                        sliderColor: Color.fromARGB(255, 1, 247, 255),
                        unSelectedColor: Color(0xffD7DEE7),
                      ),
                      Text('Humidity',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  //Row(children: [Text("Temperature")]),
                ], //children
              ),
              alignment: Alignment.topRight,
            ),
///////////////////// gauge ends here/////////////////////////////////////////
////////////////// chart begin here//////////////////////////////////////////
            Container(
              height: 200,
              width: 500,
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: Scaffold(
                  body: SfCartesianChart(
                      series: <LineSeries<LiveData, int>>[
                    LineSeries<LiveData, int>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController = controller;
                      },
                      dataSource: chartData,
                      color: Color.fromARGB(255, 1, 247, 255),
                      xValueMapper: (LiveData sales, _) => sales.time,
                      yValueMapper: (LiveData sales, _) => sales.speed,
                    ),
                    /*
                    LineSeries<LiveData, int>(
                      onRendererCreated: (ChartSeriesController controller) {
                        _chartSeriesController2 = controller;
                      },
                      dataSource: chartData2,
                      color: Color.fromARGB(255, 4, 152, 88),
                      xValueMapper: (LiveData sales, _) => sales.time,
                      yValueMapper: (LiveData sales, _) => sales.speed,
                    )*/
                  ],
                      primaryXAxis: NumericAxis(
                        //majorGridLines: const MajorGridLines(width: 5),
                        //edgeLabelPlacement: EdgeLabelPlacement.shift,
                        interval: 0.2,
                        //title: AxisTitle(text: 'Time (seconds)')
                      ),
                      primaryYAxis: NumericAxis(
                          maximum: 100,
                          //axisLine: const AxisLine(width: 5),
                          majorTickLines: MajorTickLines(size: 5),
                          title: AxisTitle(text: 'Temperature & Humidity')))),
            ),
///////////////////////////////////////////////////////////////////////// chart ends here/////
            Text("Liquid Tank",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                )),
            Container(
                height: 120,
                width: 500,
                margin: const EdgeInsets.only(right: 10, left: 10, top: 5),
                child: Scaffold(
                    body: LiquidLinearProgressIndicator(
                  value: 0.37,
                  valueColor:
                      AlwaysStoppedAnimation(Color.fromARGB(255, 1, 247, 255)),
                  backgroundColor: Colors.white,
                  borderColor: Color.fromARGB(255, 2, 23, 247),
                  borderWidth: 5.0,
                  borderRadius: 12.0,
                  direction: Axis.vertical,
                  // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                  center: Text("37%"),
                ))),
          ],
        ),
      ),
    );
  } // end of widget build

  //////////////////////////this is for real time chart/////////////////
  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  /*
  //second line
  void updateDataSource2(Timer timer) {
    chartData2.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData2.removeAt(0);
    _chartSeriesController2.updateDataSource(
        addedDataIndex: chartData2.length - 1, removedDataIndex: 0);
  }*/

  ///////// array for real time chart //////////////////////
  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 10),
      LiveData(2, 18),
      LiveData(3, 28),
      LiveData(3, 40),
      LiveData(4, 45),
      LiveData(5, 60),
      LiveData(6, 70),
      LiveData(7, 65),
      LiveData(8, 60),
      LiveData(9, 65),
      LiveData(10, 40),
      LiveData(11, 47),
      LiveData(12, 41),
      LiveData(13, 37),
      LiveData(14, 25),
      LiveData(15, 27),
      LiveData(16, 37),
      LiveData(17, 41),
      LiveData(18, 47)
    ];
  }

  /*
  List<LiveData> getChartData2() {
    return <LiveData>[
      LiveData(0, 12),
      LiveData(2, 20),
      LiveData(3, 30),
      LiveData(3, 42),
      LiveData(4, 47),
      LiveData(5, 62),
      LiveData(6, 72),
      LiveData(7, 67),
      LiveData(8, 62),
      LiveData(9, 67),
      LiveData(10, 42),
      LiveData(11, 49),
      LiveData(12, 43),
      LiveData(13, 39),
      LiveData(14, 27),
      LiveData(15, 29),
      LiveData(16, 39),
      LiveData(17, 42),
      LiveData(18, 49)
    ];
  }*/
}

////////////////////// class fro get data to real time chart///////////////
class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
