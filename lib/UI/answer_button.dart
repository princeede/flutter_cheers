import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: new Material(
        color: _answer ? Colors.lightGreen : Colors.redAccent,
        child: InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0
                )
              ),
              padding: EdgeInsets.all(20.0),
              child: Text(_answer ? 'Fact' : 'Myth', style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            ),
          ),
        ),
      ),
    );
  }
}