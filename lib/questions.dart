import 'package:flutter/material.dart';
import 'package:quizmax/answer_button.dart';
import 'package:quizmax/data/questionsf.dart';
import 'package:google_fonts/google_fonts.dart';
class Questions extends StatefulWidget{
  const Questions(this.onSelectAnswer, {super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<Questions> createState(){
    return _Questions();
  }
}
class _Questions extends State<Questions>{
  var currentQuestionIndex = 0;
  answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
    currentQuestionIndex++;
    });

  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
            currentQuestion.text,
             style: GoogleFonts.openSans(
               color: const Color.fromARGB(200, 201, 153, 251),
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () { answerQuestion(answer); });
            }
            ),
          ],
        ),
      ),
    );

  }
}