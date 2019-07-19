import 'package:flutter/material.dart';
import './quiz_page.dart';

class QuizLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey[900],
      textStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Oswald",
        fontWeight: FontWeight.bold,
      ),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Myths or facts',
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
            Text(
              "Tap to start!",
              style: TextStyle (
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new QuizPage())),
      ),
    );
  }
}
