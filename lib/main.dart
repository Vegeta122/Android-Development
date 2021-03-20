import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var questions = [
    {
      'questionText': 'What is my favourite color',
      'answers': [
        {'text': 'Green', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Yellow', 'score': 3},
        {'text': 'Blue', 'score': 1}
      ]
    },
    {
      'questionText': 'Whats is my favourite food',
      'answers': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Noodles', 'score': 5},
        {'text': 'Pasta', 'score': 3},
        {'text': 'Sushi', 'score': 1}
      ]
    },
    {
      'questionText': 'Whats is my favourite video game',
      'answers': [
        {'text': 'Contra', 'score': 10},
        {'text': 'Double Dragon', 'score': 5},
        {'text': 'Mario', 'score': 3},
        {'text': 'Donkey Kong', 'score': 1}
      ]
    },
  ];

  void resetquiz() {
    setState(() {
      questionIndex = 0;
      totalscore = 0;
    });
  }

  int totalscore = 0;

  void answerQuestion(int score) {
    totalscore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
    if (questionIndex < questions.length) {
      print('More Questions');
    } else {
      print('no more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions)
            : Result(totalscore, resetquiz),
      ),
    );
  }
}
