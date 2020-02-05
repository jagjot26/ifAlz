import 'package:flutter/material.dart';
import 'package:if_alz/choice.dart';

class Result extends StatefulWidget {
  final int simonLevel;
  final int celebrityPoints;
  final int patternPoints;
  Result(
      {this.simonLevel = 0, this.celebrityPoints = 0, this.patternPoints = 0});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.06,
                vertical: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (widget.simonLevel +
                            widget.patternPoints +
                            widget.celebrityPoints >=
                        13)
                    ? Text(
                        "Rest assured, you don't have Alzheimer's!",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(fontSize: 33, color: Colors.green),
                      )
                    : Text(
                        "Unfortunately, you might have early onset Alzheimer's and you need to see a doctor point blank",
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(fontSize: 25, color: Colors.red[300]),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  'Simon Points',
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontSize: 30),
                ),
                (widget.simonLevel >= 6)
                    ? Text(
                        widget.simonLevel.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.green, fontSize: 25),
                      )
                    : Text(
                        widget.simonLevel.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.red, fontSize: 25),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Celebrity Points',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontSize: 30),
                ),
                (widget.celebrityPoints > 4)
                    ? Text(
                        widget.celebrityPoints.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.green, fontSize: 25),
                      )
                    : Text(
                        widget.celebrityPoints.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.red, fontSize: 25),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Riddle Points',
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontSize: 30),
                ),
                (widget.patternPoints > 2)
                    ? Text(
                        widget.patternPoints.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.green, fontSize: 25),
                      )
                    : Text(
                        widget.patternPoints.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.red, fontSize: 25),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChoiceScreen(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                    child: ListTile(
                      title: Text(
                        "Back to Home Page ",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
