import 'package:flutter/material.dart';

//Pages
import '../pages/quiz_landing_page.dart';
import '../pages/tips_page.dart';

class ResourcesPage extends StatelessWidget{

  final TabController controller;

  ResourcesPage({this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        new TipsPage(),
        new QuizLandingPage(),
      ],
      controller: controller,
    );
  }
}