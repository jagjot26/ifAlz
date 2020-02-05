import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../game_choose.dart';
import '../result.dart';

bool userAnswered = false;
bool correctAnswer = false;

class PatternFourth extends StatefulWidget {
  final int simonLevel;
  final int celebrityPoints;
  final bool fromChooseGame;
  final int patternPoints;
  PatternFourth(
      {this.fromChooseGame = false,
      this.celebrityPoints = 0,
      this.simonLevel = 0,
      this.patternPoints = 0});
  @override
  _PatternFourthState createState() => _PatternFourthState();
}

class _PatternFourthState extends State<PatternFourth> {
  handleAnswers(bool e) {
    userAnswered = true;
    if (e) {
      correctAnswer = true;
      Fluttertoast.showToast(msg: "Correct answer, good job!");
    } else {
      Fluttertoast.showToast(msg: "Wrong answer :( ");
    }
    setState(() {});
  }

  @override
  void initState() {
    correctAnswer = false;
    userAnswered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.005),
        child: Column(
          children: <Widget>[
            Text(
              'Pattern Quiz',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 30, fontFamily: 'Quicksand'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                image: DecorationImage(
                    image: AssetImage('images/Q3.png'), fit: BoxFit.fitHeight),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'Q3. Find the missing symbol in the sequence.',
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 22, fontFamily: 'Quicksand'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(false);
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.23,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage('images/Q3.1.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(false);
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage('images/Q3.2.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(false);
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage('images/Q3.3.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(true);
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: AssetImage('images/Q3.4.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.63,
                    ),
                    (userAnswered)
                        ? RawMaterialButton(
                            onPressed: () {
                              if (widget.fromChooseGame &&
                                  widget.simonLevel == 0) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GameChoose(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Result(
                                      simonLevel: widget.simonLevel,
                                      celebrityPoints: widget.celebrityPoints,
                                      patternPoints: (correctAnswer)
                                          ? widget.patternPoints + 1
                                          : widget.patternPoints,
                                    ),
                                  ),
                                );
                              }
                            },
                            //RawMaterialButton widget class is used for building buttons from scratch
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              color: Colors.white,
                            ), //Icon widget requires an either Icons.someicon or FontAwesomeIcons.someicon value
                            constraints:
                                BoxConstraints.tightFor(width: 56, height: 56),
                            shape: CircleBorder(),
                            fillColor: Color(0xFF4C4F5E),
                            elevation: 0.0,
                          )
                        : Text(''),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
