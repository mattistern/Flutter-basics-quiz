import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);

    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Blue', 'score': 0},
          {'text': 'White', 'score': 5},
          {'text': 'Yellow', 'score': 10},
          {'text': 'Black', 'score': 10}
        ],
      },
      {
        'questionText': 'What\'s your favorite football club?',
        'answers': [
          {'text': 'Beitar', 'score': 10},
          {'text': 'Maccabi TLV', 'score': 5},
          {'text': 'Maccabi Haifa', 'score': 0},
          {'text': 'Hpoel TLV', 'score': 0},
        ],
      },
      {
        'questionText': 'Who\'s your favorite football player?',
        'answers': [
          {'text': 'Ronaldo', 'score': 10},
          {'text': 'Messi', 'score': 10},
          {'text': 'Neymar', 'score': 5},
          {'text': 'Benzema', 'score': 4},
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                finalScore: _totalScore,
                restart: _restartQuiz,
              ),
      ),
    );
    throw UnimplementedError();
  }
}
