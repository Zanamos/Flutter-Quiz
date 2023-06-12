// ctrl + alt + l == reformat
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final void Function() onTap;
  final String answerText;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 63, 1, 103),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
          ),
          child: Text(answerText, textAlign: TextAlign.center,)
      ),
    );
  }
}