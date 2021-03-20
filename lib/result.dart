import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function reset;

  Result(this.resultscore, this.reset);

  String get resultPhrase {
    var resultText = '';
    if (resultscore == 30) {
      resultText = 'Nice Deduction Sherlock';
    } else if (resultscore <= 30 && resultscore > 10) {
      resultText = 'Halfway There';
    } else {
      resultText = 'Not Good Enough';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz',
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue)),
            // textColor: Colors.blue,
            onPressed: reset,
          ),
        ],
      ),
    );
  }
}
