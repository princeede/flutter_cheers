import 'package:flutter/material.dart';

//UIs
import '../UI/alcohol_chart.dart';
import '../UI/home_performace_card.dart';
import '../UI/provincial_stats.dart';

class StatsPage extends StatefulWidget {
  final String title;
  final TabController controller;

  StatsPage({this.title, this.controller});

  StatsPageState createState() => new StatsPageState();
}

class StatsPageState extends State<StatsPage> {
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = "Weekly";
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: <Widget>[
          new Weekly(),
          new Weekly(),
          new ProvincialStats.withSampleData(),
    ],
    controller: widget.controller,
    );
  }
}

class Weekly extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      children: <Widget>[
        Column(
          children: <Widget>[
            new AlcoholChart(),
            new HomeGoalPerformanceCard("56", "Drinks", "Wine", "Favourite"),
            new HomeGoalPerformanceCard("2341 g", "Alcohol", "0.207%", "Max BAC"),
            new HomeGoalPerformanceCard("5634 kcal", "Calories", "Wine", "Standard Drinks"),
            new HomeGoalPerformanceCard("40", "Sessions", "3.7", "Drinks/Session"),
            new HomeGoalPerformanceCard("56h", "Time Intoxicated", "12.4%", "Time Intoxicated"),
//            Padding(
//              padding: EdgeInsets.only(left: 8.0, right: 20.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: <Widget>[
//                  DropdownButton<String>(
//                    value: dropdownValue,
//                    //              style: TextStyle(color: Colors.white),
//                    onChanged: (String newValue) {
//                      setState(() {
//                        dropdownValue = newValue;
//                      });
//                    },
//                    items: <String>['Weekly', 'Monthly']
//                        .map<DropdownMenuItem<String>>((String value) {
//                      return DropdownMenuItem<String>(
//                        value: value,
//                        child: Text(
//                          value,
//                          style: TextStyle(color: Colors.deepOrangeAccent),
//                        ),
//                      );
//                    }).toList(),
//                  ),
//                ],
//              ),
//            ),
          ],
        ),
      ],
    );
  }
}


