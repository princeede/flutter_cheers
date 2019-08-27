import 'package:flutter/material.dart';
import '../models/DrinkTemplate.dart';

class DrinkTemplatePage extends StatefulWidget {
  @override
  DrinkTemplatePageState createState() => DrinkTemplatePageState();
}

class DrinkTemplatePageState extends State<DrinkTemplatePage> {
  final _formKey = GlobalKey();
//  final _drinkTemplate = DrinkTemplate();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Drink Template",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Oswald",
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueGrey[800],
          elevation: 0,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Padding(
          padding: EdgeInsets.all(6),
          child: Builder(
              builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Drink Name",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Oswald",
                              fontWeight: FontWeight.normal,
                            ),
                            fillColor: Colors.white,
                            hoverColor: Colors.grey,
                            focusColor: Colors.grey,
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.normal,
//                            fontSize: 10,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the name of the drink";
                            } else {
                              return null;
                            }
                          },
//                      onSaved: (val) => setState(() => ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Alcohol percentage (%)"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the percentage of alcohol in the drink";
                            } else {
                              return null;
                            }
                          },
//                      onSaved: (val) => setState(() => ),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Quantity (oz)"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the quantity for one unit of the drink";
                            } else {
                              return null;
                            }
                          },
//                      onSaved: (val) => setState(() => ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Price (CAD)"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter the price for the drink";
                            } else {
                              return null;
                            }
                          },
//                      onSaved: (val) => setState(() => ),
                        ),
                      ],
                    ),
                  )
          ),
        )
    );
  }
}
