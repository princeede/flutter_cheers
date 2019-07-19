import 'package:flutter/material.dart';

class TipCard extends StatelessWidget {

  final String title, excerpt;

  TipCard({this.title, this.excerpt});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      elevation: 4,
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Oswald",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.start,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Author", style: TextStyle(color: Colors.white70, fontFamily: "Oswald"),),
                Padding(padding: EdgeInsets.only(right: 10)),
                Text("Date",  style: TextStyle(color: Colors.white70, fontFamily: "Oswald"),),
              ],
            ),
            Text(excerpt, style: TextStyle(fontFamily: "Oswald", color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
