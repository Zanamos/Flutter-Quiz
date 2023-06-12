import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizmax/data/questionsf.dart';
import 'package:quizmax/questions_summary.dart';
var iconStyle = const Icon(
  Icons.restart_alt_rounded,
  color: Color.fromARGB(255, 222, 172, 255),);
var btnTextStyle = GoogleFonts.openSans(
    color: const Color.fromARGB(255, 255, 255, 255),
    fontSize: 20,
    fontWeight: FontWeight.w400);
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers, required this.restartScreen});
  final void Function()? restartScreen;

  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for(var i = 0; i < chosenAnswers.length;i++){
      summary.add({
         'questions_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
  return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Text(
                  'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                textAlign: TextAlign.center,

                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(190, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: restartScreen,
              label: Text(
                'Restart Quiz',
                style: btnTextStyle
              ),
              icon: iconStyle
            ),
          ],
        ),
      )

    );
  }
}