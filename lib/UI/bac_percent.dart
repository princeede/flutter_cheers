import 'package:flutter/material.dart';

class BACPercent extends StatefulWidget{
  BACPercentState createState() => new BACPercentState();
}

class BACPercentState extends State<BACPercent>{

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Material(
              color: Colors.blueGrey[700],
              child: Center(
                child: Text(
                  "0.005%",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight:
                    FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Oswald"
                  ),
                ),
              )
          )
      );
  }
}