import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';

import '../pages/calender_page.dart';

class HomeFAB extends StatefulWidget{

  HomeFABState createState() => new HomeFABState();
}

class HomeFABState extends State<HomeFAB>{

  //Provides an image of a cat
  static String getNewCatUrl() {
    return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
        '#${new DateTime.now().millisecondsSinceEpoch}';
  }

  int _counter = 0;

  //Adds value to counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //Prints the value of the counter
//  void _logCounter() {
//    setState(() {
//      print(_counter);
//    });
//  }

  @override
  Widget build(BuildContext context) {

//    ImageProvider img = new NetworkImage(getNewCatUrl());

    //The list of FabMiniMenuItems that we are going to use
    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
          new Icon(Icons.add, color: Colors.white,),
          Colors.blueGrey,
          5.0,
          "Button Menu",
          _incrementCounter,
          "Add Beer",
          Colors.blueGrey,
          Colors.white,
          true
      ),

      new FabMiniMenuItem.withText(
          new Icon(Icons.add, color: Colors.white,),
          Colors.blueGrey,
          5.0,
          "Button Menu",
          _incrementCounter,
          "Add Wine",
          Colors.blueGrey,
          Colors.white,
          true
      ),

      new FabMiniMenuItem.withText(
          new Icon(Icons.add, color: Colors.white,),
          Colors.blueGrey,
          5.0,
          "Button Menu",
          _incrementCounter,
          "Add Malt",
          Colors.blueGrey,
          Colors.white,
          true
      ),
//
//      new FabMiniMenuItem.withText(
//          new Icon(Icons.add, color: Colors.white,),
//          Colors.blueGrey,
//          5.0,
//          "Button Menu",
//          _incrementCounter,
//          "Add Spirit",
//          Colors.blueGrey,
//          Colors.white,
//          true
//      ),
//
//      new FabMiniMenuItem.withText(
//          new Icon(Icons.add, color: Colors.white,),
//          Colors.blueGrey,
//          5.0,
//          "",
//          goToPage,
//          "Calender",
//          Colors.blueGrey,
//          Colors.white,
//          true
//      ),

    ];
    return new FabDialer(_fabMiniMenuItemList, Colors.orange, new Icon(Icons.add, color: Colors.black,));
  }

  void goToPage(){
    String name = "calender";
    switch(name){
      case "calender":
//        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CalenderPage(title: "Diary",)));
        break;
      default:
        break;
    }
  }
}