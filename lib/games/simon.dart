import 'dart:async';

import 'package:flutter/material.dart';
import 'package:if_alz/games/blinking_button.dart';
import 'package:if_alz/games/celebrity.dart';
import 'package:if_alz/games/simon_help.dart';
import 'dart:math';

var colors = [Colors.green, Colors.blue, Colors.red, Colors.orange];
var gamePattern = [];
var userClickedPattern = [];
int counter = 0;
int levelCounter = 1;
bool isGameOver = false;
bool stageComplete = false;
bool isGameStarted = false;

class SimonGame extends StatefulWidget {
  final bool fromChooseGame;
  SimonGame({this.fromChooseGame = false});

  @override
  _SimonGameState createState() => _SimonGameState();
}

class _SimonGameState extends State<SimonGame> with TickerProviderStateMixin {
  Animation<Color> animation1;
  AnimationController controller1;
  Animation<Color> animation2;
  AnimationController controller2;
  Animation<Color> animation3;
  AnimationController controller3;
  Animation<Color> animation4;
  AnimationController controller4;

  @override
  void initState() {
    isGameOver = false;
    isGameStarted = false;
    stageComplete = false;
    counter = 0;
    levelCounter = 1;
    gamePattern = [];
    userClickedPattern = [];
    //for green
    controller1 = AnimationController(
        duration: const Duration(milliseconds: 170), vsync: this);
    final CurvedAnimation curve1 =
        CurvedAnimation(parent: controller1, curve: Curves.linear);
    animation1 =
        ColorTween(begin: colors[0], end: Colors.white).animate(curve1);
    animation1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller1.reverse();
      }
      setState(() {});
    });

    //for blue
    controller2 = AnimationController(
        duration: const Duration(milliseconds: 170), vsync: this);
    final CurvedAnimation curve2 =
        CurvedAnimation(parent: controller2, curve: Curves.linear);
    animation2 =
        ColorTween(begin: colors[1], end: Colors.white).animate(curve2);
    animation2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller2.reverse();
      }
      setState(() {});
    });

//for red
    controller3 = AnimationController(
        duration: const Duration(milliseconds: 170), vsync: this);
    final CurvedAnimation curve3 =
        CurvedAnimation(parent: controller3, curve: Curves.linear);
    animation3 =
        ColorTween(begin: colors[2], end: Colors.white).animate(curve3);
    animation3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller3.reverse();
      }
      setState(() {});
    });

//for orange
    controller4 = AnimationController(
        duration: const Duration(milliseconds: 170), vsync: this);
    final CurvedAnimation curve4 =
        CurvedAnimation(parent: controller4, curve: Curves.linear);
    animation4 =
        ColorTween(begin: colors[3], end: Colors.white).animate(curve4);
    animation4.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller4.reverse();
      }
      setState(() {});
    });
    super.initState();
  }

  handleNextSequence() {
    var random = new Random();
    int randomIndex = random.nextInt(4);
    Color randomChosenColor = colors[randomIndex];
    gamePattern.add(randomChosenColor);
    if (randomChosenColor == Colors.green) {
      controller1.forward();
    }
    if (randomChosenColor == Colors.blue) {
      controller2.forward();
    }
    if (randomChosenColor == Colors.red) {
      controller3.forward();
    }
    if (randomChosenColor == Colors.orange) {
      controller4.forward();
    }
  }

  goAhead() async {
    if (gamePattern[counter - 1] !=
        userClickedPattern[counter - 1]) //when game over happens, stuff to do
    {
      isGameOver = true;
      stageComplete = true;
      setState(() {});
      //  keyBoolValue=false;
      //  $("body").addClass("game-over");
      //  setTimeout(function(){$("body").removeClass("game-over");}, 230);
      //  $("#level-title").text("Game Over, n00b. Press any key to restart!");

      //  var audi=new Audio('sounds/wrong.mp3');
      //  audi.play();
      //  $(document).on("keydown",function(){
      //    if(keyBoolValue==false){
      //    keyBoolValue=true;
      //    levelCounter=1;
      //    counter=0;
      //    gamePattern=[];
      //    userClickedPattern=[];
      //    changeHeading();
      //     nextSequence();
      //   }
      //  });

    }
    if (gamePattern.length != 0 &&
        counter == gamePattern.length &&
        gamePattern[counter - 1] ==
            userClickedPattern[counter - 1]) //after each level
    {
      levelCounter++;
      if (levelCounter == 7) {
        stageComplete = true;
      }
      Timer(Duration(milliseconds: 200), () {
        setState(() {});
      });

      userClickedPattern = [];
      counter = 0;
      Timer(Duration(milliseconds: 1000), () {
        handleNextSequence();
      });
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isGameOver ? Colors.red[200] : Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SimonHelp(),
                        ),
                      );
                    },
                    child: Icon(Icons.help)),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: isGameOver
                ? Text(
                    'Game Over',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(fontFamily: 'Quicksand', color: Colors.white),
                  )
                : Text(
                    'Level ${levelCounter.toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(fontFamily: 'Quicksand'),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.097,
                  MediaQuery.of(context).size.height * 0.08,
                  MediaQuery.of(context).size.width * 0.097,
                  MediaQuery.of(context).size.height * 0.075),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animation1,
                            builder: (BuildContext context, Widget child) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isGameOver && isGameStarted == true) {
                                    userClickedPattern.add(colors[0]);
                                    controller1.forward();
                                    counter++;
                                    goAhead();
                                  }
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: animation1.value,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animation2,
                            builder: (BuildContext context, Widget child) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isGameOver && isGameStarted == true) {
                                    userClickedPattern.add(colors[1]);
                                    controller2.forward();
                                    counter++;
                                    goAhead();
                                  }
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: animation2.value,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animation3,
                            builder: (BuildContext context, Widget child) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isGameOver && isGameStarted == true) {
                                    userClickedPattern.add(colors[2]);
                                    controller3.forward();
                                    counter++;
                                    goAhead();
                                  }
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: animation3.value,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animation4,
                            builder: (BuildContext context, Widget child) {
                              return GestureDetector(
                                onTap: () {
                                  if (!isGameOver && isGameStarted == true) {
                                    userClickedPattern.add(colors[3]);
                                    controller4.forward();
                                    counter++;
                                    goAhead();
                                  }
                                },
                                child: new Container(
                                  decoration: BoxDecoration(
                                    color: animation4.value,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          (widget.fromChooseGame && isGameStarted)
              ? Container(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.11),
                )
              : stageComplete == true
                  ? GestureDetector(
                      onTap: () {
                        if (widget.fromChooseGame && isGameOver) {
                          setState(() {
                            isGameOver = false;
                            isGameStarted = false;
                            stageComplete = false;
                            counter = 0;
                            levelCounter = 1;
                            gamePattern = [];
                            userClickedPattern = [];
                          });
                        } else if (widget.fromChooseGame) {
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CelebrityGame(simonLevel: levelCounter),
                            ),
                          );
                        }
                      },
                      child: Card(
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 88),
                        child: ListTile(
                          title: Text(
                            "Next Stage →",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isGameStarted = true;
                        });
                        handleNextSequence();
                      },
                      child: Card(
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 88),
                        child: ListTile(
                          title: Text(
                            "Start",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }
}

// main() {
//   start to start game
//   var colors=[
//   'green', 'red', 'yellow', 'blue'
// ];
// var gamePattern=[];
// var userClickedPattern=[];
// var userChosenColor;
// var counter=0;
//   var rng = new Random();
//   var rngIndex = rng.nextInt(4)+1;
//    var randomChosenColor = colors[rngIndex];
//   gamePattern.push(randomChosenColor);
//   animate random chosen colour
// }
