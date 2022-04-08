import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function restart;

  Result({
    @required this.finalScore,
    @required this.restart,
  });

  String get resultText {
    String finalText;
    if (finalScore <= 10) {
      finalText = 'You don\'t understand football';
    } else if (finalScore <= 20) {
      finalText = 'You understand a little football';
    } else {
      finalText = 'You understand football!!!';
    }
    return finalText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            color: Colors.blue,
            onPressed: restart,
            child: Text(
              'Restart quiz',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
