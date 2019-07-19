import 'package:flutter/material.dart';


class TotalCumulativeDrink extends StatefulWidget{
  TotalCumulativeDrinkState createState() => new TotalCumulativeDrinkState();
}

class TotalCumulativeDrinkState extends State<TotalCumulativeDrink>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("2", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              Text("drinks", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.normal),)
            ],
          ),
          Row(
            children: <Widget>[
              Text("10", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              Text(" oz", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.normal),)
            ],
          ),
          Row(
            children: <Widget>[
              Text("8", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              Text(" CAD", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.normal),)
            ],
          ),
        ],
      ),
    );
  }
}