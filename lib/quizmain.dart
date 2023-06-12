import 'package:flutter/material.dart';
import 'package:quizmax/questions.dart';
import 'start_screen.dart';
import 'main.dart';
import 'package:quizmax/data/questionsf.dart';
import 'package:quizmax/results.dart';
class QuizMain extends StatefulWidget{
  const QuizMain({super.key});
  @override
  State<QuizMain> createState() => _QuizState();

}
class _QuizState extends State<QuizMain>{
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";
  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";
    });
  }
  void restartScreen(){
    setState(() {
      selectedAnswers = [];
      activeScreen = "start-screen";
    });
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
    }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen') {
      screenWidget = Questions(chooseAnswer);
    }
    if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, restartScreen: restartScreen,);
    }
    if(activeScreen == 'start-screen'){
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: decorBg,
          child: screenWidget,
        ),
      ),
    );
  }
}