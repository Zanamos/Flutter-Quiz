import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
var textGood = GoogleFonts.openSans(
  fontSize: 20,
  color: const Color.fromARGB(216, 63, 255, 41),
  fontWeight: FontWeight.w400
);
var textBad = GoogleFonts.openSans(
    fontSize: 20,
    color: const Color.fromARGB(190, 255, 32, 32),
    fontWeight: FontWeight.w400
);
var textAns = GoogleFonts.openSans(
    color: const Color.fromARGB(216, 63, 255, 41),
  fontSize: 20,
  fontWeight: FontWeight.w400
);
class QuestionsSummary extends StatelessWidget{
   const QuestionsSummary(this.summaryData, {super.key});
   final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 4,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
            color: const Color.fromARGB(40, 89, 3, 114),
            width: 3.5,

          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer'] ?
                        const Color.fromARGB(230, 59, 244, 118) :
                        const Color.fromARGB(240, 245, 40, 145),
                      ),
                      child: Center(
                        child: Text(
                          ((data['questions_index'] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(233, 233, 233, 233),
                          ),
                        ),
                      ),
                    ),


                  ),

                     Expanded(
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              data['question'] as String,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 255, 255, 255),)),

                          const SizedBox(height: 10),
                          Text(
                              data['user_answer'] as String,
                              textAlign: TextAlign.left ,
                              style: data['user_answer'] == data['correct_answer'] ?
                              textGood :
                              textBad
                          ),
                          const SizedBox(height: 5),
                          Text(data['correct_answer'] as String, textAlign: TextAlign.left ,style: textAns),
                          const SizedBox(height: 5),
                        ],
                    ),
                     ),

                ],
              );
            },
            ).toList(),
          ),
        ),
      ),
    );
  }
}