import 'package:flutter/material.dart';

//UIs
import '../UI/area_chart.dart';
import '../UI/home_fab.dart';
import '../UI/home_performace_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.only(top: 20, bottom: 20),
//          child:
          ListView(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new TimeSeriesLineAnnotationChart.withSampleData(),
                  new HomeGoalPerformanceCard("14", "Sessions", "88%", "Performance"),
                  new HomeGoalPerformanceCard("REC", "Zone", "3d 18hr", "Sober"),
                ],
              ),
            ],
          ),
        new HomeFAB(),
      ],
    );
  }
}
