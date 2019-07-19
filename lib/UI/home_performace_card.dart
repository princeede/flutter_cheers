import 'package:flutter/material.dart';

class HomeGoalPerformanceCard extends StatefulWidget{

  final String _title1, _title2, _subtitle1, _subtitle2;

  HomeGoalPerformanceCard(this._title1, this._subtitle1, this._title2, this._subtitle2);

  HomeGoalPerformanceCardState createState() => new HomeGoalPerformanceCardState();
}

class HomeGoalPerformanceCardState extends State<HomeGoalPerformanceCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0,),

      child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(widget._title1, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Oswald"),),
                      Text(widget._subtitle1, style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Oswald"),)
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(widget._title2, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Oswald"),),
                      Text(widget._subtitle2, style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Oswald"),)
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}