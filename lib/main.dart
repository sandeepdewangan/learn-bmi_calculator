import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'result.dart';
import 'bmi_api.dart';
/*
1. Themes
--------------------
1. copyWith can be used to copy the default theme data values.
2. For changing individual theme data of widgets wrap it with Theme().

2. Customized Slider Theme
--------------------
  Wrap with SliderTheme(data: SliderTheme.of(context).copyWith())
  It will try match up with the nearest context with all values copy
  except those are specified.

3. Named Routes
-------------------------
MaterialApp(
  initialRoute: '/home', (NOTE When you give scafold body its home page it will be redundand)
    routes: {
      '/home' : (context) => BMICalculator(),
      '/result' : (context) => ResultPage(),
    }
)

 */
void main() => runApp(
  MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(kbackgroundColor),
    ),
    home: Scaffold(
      backgroundColor: Color(kbackgroundColor),
      appBar:AppBar(
        title: Text('My BMI'),
      ),
      body: BMICalculator(),
    ),
    routes: {
      '/result' : (context) => ResultPage(),
    },
  )
);

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

enum Gender{
  male,
  female
}

class _BMICalculatorState extends State<BMICalculator> {

  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 25;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Gender card
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              // Male Card
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    color: Color(selectedGender == Gender.male ? kcardSelectedBackgroundColor : kcardBackgroundColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.tag_faces,
                          size: 70.0,
                          color: Color(selectedGender == Gender.male ? kWhiteText : koffWhiteText),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(selectedGender == Gender.male ? kWhiteText : koffWhiteText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Female Card
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    color: Color(selectedGender == Gender.female ? kcardSelectedBackgroundColor : kcardBackgroundColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.face,
                          color: Color(selectedGender == Gender.female ? kWhiteText : koffWhiteText),
                          size: 70.0,
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            color: Color(selectedGender == Gender.female ? kWhiteText : koffWhiteText),
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Height card
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            color: Color(kcardBackgroundColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: TextStyle(
                    color: Color(koffWhiteText),
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'cm',
                      style: TextStyle(
                        color: Color(koffWhiteText),
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(kcardSelectedBackgroundColor),
                    activeTrackColor: Color(kbuttonColor),
                    thumbColor: Color(kbuttonColor),
                    overlayColor: Color(kbuttonTransparentColor),
                  ),
                  child: Slider(
                    onChanged: (newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                    value: height.toDouble(),
                    min: 130.0,
                    max: 210.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Weight and Age card
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              // Weight Card
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  color: Color(kcardBackgroundColor),
                  // Weight Col
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(koffWhiteText),
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                            constraints: BoxConstraints.tightFor(
                              width: 40.0,
                              height: 40.0,
                            ),
                            shape: CircleBorder(),
                            elevation: 10.0,
                            fillColor: Color(kcardSelectedBackgroundColor),
                            highlightColor: Color(kbuttonColor),
                            child: Icon(
                                Icons.remove,
                                size: 40.0,
                              color: Color(koffWhiteText),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          RawMaterialButton(
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            constraints: BoxConstraints.tightFor(
                              width: 40.0,
                              height: 40.0,
                            ),
                            shape: CircleBorder(),
                            elevation: 10.0,
                            fillColor: Color(kcardSelectedBackgroundColor),
                            highlightColor: Color(kbuttonColor),
                            child: Icon(
                              Icons.add,
                              size: 40.0,
                              color: Color(koffWhiteText),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Age Card
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  color: Color(kcardBackgroundColor),
                  // Age Col
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(koffWhiteText),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            constraints: BoxConstraints.tightFor(
                              width: 40.0,
                              height: 40.0,
                            ),
                            shape: CircleBorder(),
                            elevation: 10.0,
                            fillColor: Color(kcardSelectedBackgroundColor),
                            highlightColor: Color(kbuttonColor),
                            child: Icon(
                              Icons.remove,
                              size: 40.0,
                              color: Color(koffWhiteText),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          RawMaterialButton(
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            constraints: BoxConstraints.tightFor(
                              width: 40.0,
                              height: 40.0,
                            ),
                            shape: CircleBorder(),
                            elevation: 10.0,
                            fillColor: Color(kcardSelectedBackgroundColor),
                            highlightColor: Color(kbuttonColor),
                            child: Icon(
                              Icons.add,
                              size: 40.0,
                              color: Color(koffWhiteText),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Calculate BMI Button
        Expanded(
          child: MaterialButton(
            onPressed: (){
              BMI bmi = BMI(weight: weight, height: height, age: age);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmi: bmi.getBMI(),
                  description: 'This is sample description',
                ),
              ));
            },
            color: Color(kbuttonColor),
            child: Text(
                'CALCULATE BMI',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
            ),
          ),
        ),
      ],
    );
  }
}
