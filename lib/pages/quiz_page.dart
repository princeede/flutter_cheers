import 'package:flutter/material.dart';

import '../utils/quiz.dart';
import '../utils/questions.dart';
import '../pages/quiz_landing_page.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Alcohol problems are mostly caused by alcoholics", false, "Immediate problems like motor accidents, violent assaults and accidental injury are mostly caused by moderate drinkers who occasionally overdo it."),
    new Question("Drinking coffee sobers you up", false, "Your liver is like a car with one gear. It can only work at one speed. So there is only one cure for drunkenness - time. Drinking coffee will make you wide awake and drunk. Taking a cold shower will make you cold, wet and drunk."),
    new Question("A 'blackout' is when you pass out of drink", false, "Blackout a type of memory loss. Your friends can recite what you did, but you can't. It is an early warning sign to cut down."),
    new Question("it is not safe to drink when you are pregnant", true, "The alcohol enters your baby's bloodstream, therefore the safest thing for your baby is not to drink at all. Regular heavy drinking can cause foetal alcohol syndrome, which causes serious developmental problems for your baby."),
    new Question("Females can't hold their drinks as well as males", true, "Men have more bodily fluids than women, so alcohol is more diluted in their systems. This goes even for women and men of the same height and build."),
    new Question("Alcohol causes as much damage to the society as heroin", false, "Alcohol causes much more damage than heroin and all the other illegal drugs put together. It is a factor in 88% of public order offences, 34% of marital breakdowns and 33% of fatal road accidents."),
    new Question("There is nothing to do around here except drink!", false, "Drinking is a feature of social life, but is not the only pastime. Take a minute to think of three non-drinking things you could do. It's just a matter of looking at things differently."),
  ]);
   
  String questionText;
  bool isCorrect;
  int questionNumber;
  bool overlayShouldBeVisible;
  String answerExplanation;

  @override
  void initState(){
    super.initState();
    initializeStateVariables(false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new AnswerButton(true, () => handleAnswer(true)),
              new QuestionText(questionText, questionNumber),
              new AnswerButton(false, () => handleAnswer(false)),
            ],
          ),
          overlayShouldBeVisible ? new CorrectWrongOverlay(isCorrect, answerExplanation, currentQuestion.answer, () => handleOverlayTap()) : Container(),
        ],
      ),
    );
  }


  void handleAnswer(bool userAnswer){
    isCorrect = (currentQuestion.answer == userAnswer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  void handleOverlayTap(){
//    currentQuestion = quiz.nextQuestion;
    this.setState((){
      initializeStateVariables(false);
    });
  }

  void initializeStateVariables(bool overlayState){
    currentQuestion = quiz.nextQuestion;
    if(quiz.questionNumber == quiz.length){
      Navigator.of(context).pop();//push(new MaterialPageRoute(builder: (BuildContext context) => new QuizLandingPage()));
      return;
    }
      overlayShouldBeVisible = overlayState;
      questionText = currentQuestion.question;
      questionNumber = quiz.questionNumber;
      answerExplanation = currentQuestion.explanation;

  }
}
