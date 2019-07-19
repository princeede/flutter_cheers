import 'package:flutter/material.dart';

//UI
import '../UI/tips_card.dart';

class TipsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      children: <Widget>[
        new TipCard(title: "How much am I drinking?", excerpt: "Weigh up the effects of continuing drinking as you are, cutting down or stopping drinking entirely.",),
        new TipCard(title: "Tips for drinking less", excerpt: "Going out tonight? Here are some tips on how you can drink less.",),
        new TipCard(title: "What to do about boredom?", excerpt: "Try to think of a list of activities that might hold your attention.",),
        new TipCard(title: "How to stick to your plans", excerpt: "Complete a plan for changing your drinking.",),
        new TipCard(title: "How drink can affect families", excerpt: "The effects on the rest of the family when someone in the family is misusing alcohol or other drugs.",),
      ],
    );
  }
}