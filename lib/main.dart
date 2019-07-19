import 'package:flutter/material.dart';

import 'pages/quiz_landing_page.dart';
import 'pages/layout_page.dart';


void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.blueGrey[700],
      accentColor: Colors.orange,
    ),
    home: new LayoutPage(title: "Cheers"),
  ));
}