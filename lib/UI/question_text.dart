import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);
  @override
  QuestionTextState createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState(){
    super.initState();

    _fontSizeAnimationController = new AnimationController(vsync: this, duration: new Duration(milliseconds: 500));
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.linear);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Center(
            child: Text(
                widget._question.toString(),
              style: TextStyle(fontSize: _fontSizeAnimation.value * 20),
              textAlign: TextAlign.center,
            ),
          ),
        )
    );
  }
}