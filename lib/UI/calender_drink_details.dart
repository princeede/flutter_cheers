import 'package:flutter/material.dart';
//import 'dart:math';

class CalendarDrinkDetails extends StatelessWidget{

  final String name, volume, percent, price, startTime, quantity;

  CalendarDrinkDetails({Key key, this.name, this.volume, this. percent, this.price, this.quantity, this.startTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.local_bar, color: Colors.white),
        ),
        title: Row(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Oswald"),
            ),
            Text(
              percent + " · ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12, fontFamily: "Oswald"),
            ),
            Text(
              volume,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 12, fontFamily: "Oswald"),
            )
          ],
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.access_time, color: Colors.orange, size: 15,),
            Text(startTime+"   ", style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: "Oswald")),
            Icon(Icons.attach_money, color: Colors.orange, size: 15,),
            Text(price, style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: "Oswald")),
          ],
        ),
        trailing:
        Text("12g", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Oswald")),
      ),
    );
  }

}