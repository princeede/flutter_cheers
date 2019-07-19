import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget{

  final bool _isCorrect;
  final String explanation;
  final bool _isFact;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this.explanation, this._isFact, this._onTap);

  @override
  CorrectWrongOverlayState createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState( (){}));
    _iconAnimationController.forward();
//    _iconAnimationController.dispose();
  }

  @override
  void dispose(){
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black87,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(widget._isCorrect ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20),),
            Text((widget._isCorrect ? "Correct, " : "Wrong, ") + (widget._isFact ? "It's a fact" : "It's a myth"), style: TextStyle(color: widget._isCorrect ? Colors.green : Colors.redAccent, fontSize: 30,)),

            Padding(
                padding: EdgeInsets.only(top: 25.0, left: 15, right: 15),
              child: Text(widget.explanation, style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.justify, ),
            )
          ],
        ),
      ),
    );
  }
}