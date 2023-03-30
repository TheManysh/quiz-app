import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import './question.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex % 2);
  }

  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": "What is your name?",
        "answers": ["A", "B", "C", "D"],
      },
      {
        "questionText": "What is your value?",
        "answers": ["1", "2", "3", "4"],
      },
      {
        "questionText": "What is your fav game?",
        "answers": ["Aa", "Bb", "Cc", "Dd"],
      },
    ];
    return MaterialApp(
        home: Scaffold(
      // appbar
      appBar: AppBar(title: const Text("Quiz App")),
      body: Column(children: <Widget>[
        Question(
          questionText: questions[_questionIndex % questions.length]
              ["questionText"] as String,
        ),
        ...(questions[_questionIndex % questions.length]["answers"]
                as List<String>)
            .map((answer) => Answer(
                  selectHandler: _answerQuestion,
                  answerText: answer,
                ))
            .toList(),
      ]), // this means a list of widgets
    ));
  }
}
