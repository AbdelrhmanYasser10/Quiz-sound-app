import 'package:app_testing_before_session/data/data.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final Map<int,int> finalUserGrad;
  const ResultsScreen({super.key, required this.finalUserGrad});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {

  late int finalGrade = 0;
  @override
  void initState() {
    super.initState();
    for(int i = 0 ; i < questions.length;i++){
        if(widget.finalUserGrad[i] != null){
          if(widget.finalUserGrad[i] == questions[i].correctAnswerIndex){
            finalGrade += 10;
          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Quiz Results",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,

        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Result is",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$finalGrade / 30",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}