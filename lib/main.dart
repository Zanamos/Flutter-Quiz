import 'package:flutter/material.dart';
import 'quizmain.dart';
const decorBg = BoxDecoration(
gradient: LinearGradient(
    colors: [Colors.deepPurple,Colors.deepPurpleAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight
),
);
void main(){
  runApp(
       const QuizMain()
  );
}
