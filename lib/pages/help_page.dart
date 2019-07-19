import 'package:flutter/material.dart';
import '../Constants.dart';

class HelpPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: Constants.appBarColor,
        elevation: 0,
      ),
      backgroundColor: Constants.mainBgColor,
      body: ListView(
        padding: EdgeInsets.only(top: 10, bottom: 10),
          children: <Widget>[
            ListTile(
              title: _helpItem(Icons.local_hospital, "Call a doctor"),
            ),
            Divider(
              color: Colors.white54,
            ),
            ListTile(
              title: _helpItem(Icons.call, "Call a friend"),
            ),
            Divider(
              color: Colors.white54,
            ),
            ListTile(
              title: _helpItem(Icons.directions_car, "Call a cab"),
            ),
            Divider(
              color: Colors.white54,
            ),
          ],
        ),
      );
  }

  Widget _helpItem(IconData icon, String text){
    return Row(
      children: <Widget>[
        Icon(icon, color: Constants.mainAccentColor,),
        Padding(padding: EdgeInsets.only(left: 20)),
        Text(text, style: TextStyle(fontFamily: "Oswald", color: Colors.white) ,)
      ],
    );
  }

}

