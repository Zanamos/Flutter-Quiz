import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartScreen extends StatelessWidget{
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(100, 255, 255, 255),
        ),
        const SizedBox(height: 80),
          Text(
          "Learn Flutter The Fun Way!",
        style: GoogleFonts.openSans(
          fontSize: 25,
          fontWeight: FontWeight.w300,
          color: const Color.fromARGB(190, 255, 255, 255),
      ),
      ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.lightbulb),
            label: const Text("Start Quiz")
        ),
      ],
    ),
    );
  }
}