import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'main.dart';

class ResultPage extends StatelessWidget {

  String bmi;
  String description;

  ResultPage({this.bmi, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(kbackgroundColor),
      appBar: AppBar(
        title: Text('My BMI Result'),
      ),
      body: ShowResult(bmi: bmi, description: description,),
    );
  }
}

class ShowResult extends StatelessWidget {

  String bmi;
  String description;

  ShowResult({this.bmi, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
        ),
        // RESULT
        Expanded(
          flex: 8,
          child: Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(15.0),
            color: Color(kcardSelectedBackgroundColor),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Text(
                    'NORMAL',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(ktextNormalColor),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 70.0,
                      color: Color(kWhiteText),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(koffWhiteText),
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'RE-CALCULATE BMI',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
            color: Color(kbuttonColor),
          ),
        ),
      ],
    );
  }
}
