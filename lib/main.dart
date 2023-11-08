import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapplestorygame/bottom.dart';
import 'package:mapplestorygame/dragon.dart';
import 'package:mapplestorygame/hulk.dart';
import 'package:mapplestorygame/tiger.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //black dragon
  int dragonSprintCount = 1;
  double dragonPosX = 0.5;
  String dragonDirection = 'left';

  //tiger
  int tigerSprintCount = 1;
  double tigerPosX = 0;
  String tigerDirection = 'right';

  //hulk features
  int hulkSprintCount = 2;
  double hulkPosX = -0.5;
  String hulkDirection = 'right';
  int attackHulkSprintCount = 0;

  //loading screen color
  var loadingScreenColor = Colors.pink[300];
  var loadingScreenTextColor = Colors.black;
  int loadingTime = 3;

  var hulkPosY;

  void playNow() {
    startGameTimer();
    moveDragon();
    moveTiger();
  }

  void startGameTimer() {
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        loadingTime--;
      });
      if (loadingTime == 0) {
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingTime = 3;
          loadingScreenTextColor = Colors.transparent;
        });
        timer.cancel();
      }
    });
  }

//moving the tiger method...
  void moveTiger() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        tigerSprintCount++;
        if (tigerSprintCount == 23) {
          tigerSprintCount = 1;
        }
      });
    });
  }

  //attack Hulk
  void attack() {
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        attackHulkSprintCount++;
      });

      if (attackHulkSprintCount == 5) {
        if (hulkDirection == 'right' && hulkPosX + 0.2 > dragonPosX) {
          // ignore: avoid_print
          print('strike');
        } else {
          // ignore: avoid_print
          print('missed');
        }
        attackHulkSprintCount = 0;
        timer.cancel();
      }
    });
  }

//moving the dragon method...
  void moveDragon() {
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      setState(() {
        dragonSprintCount++;

        if (dragonDirection == 'left') {
          dragonPosX -= 0.05;
        } else {
          dragonPosX += 0.05;
        }
        if (dragonPosX < 0.3) {
          dragonDirection = 'right';
        } else if (dragonPosX > 0.6) {
          dragonDirection = 'left';
        }
        if (dragonSprintCount == 5) {
          dragonSprintCount = 1;
        }
      });
    });
  }

  void moveLeft() {
    setState(() {
      hulkPosX -= 0.03;
      hulkSprintCount++;
      hulkDirection = 'left';
    });
  }

  void moveRight() {
    setState(() {
      hulkSprintCount++;
      hulkPosX += 0.03;
      hulkDirection = 'right';
    });
  }

  void jump() {
    double time = 0;
    double height = 0;
    double initialHeight = hulkPosX;
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(milliseconds: 70), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.5 * time;

      setState(() {
        if (initialHeight - height > 1) {
          hulkPosY = 1;
        } else {
          hulkPosY = initialHeight - height;
          hulkSprintCount = 2;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue[300],
              child: Stack(
                // ignore: prefer_const_constructors
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    alignment: Alignment(dragonPosX, 1),
                    child: BlackDragon(
                      dragonDirection: dragonDirection,
                      dragonSprintCount: dragonSprintCount,
                    ),
                  ),
                  Container(
                    alignment: Alignment(tigerPosX, 1),
                    // ignore: prefer_const_constructors
                    child: MyTiger(
                      tigerSprintCount: tigerSprintCount,
                      tigerDirection: tigerDirection,
                    ),
                  ),
                  Container(
                    alignment: Alignment(hulkPosX, 1),
                    // ignore: prefer_const_constructors
                    child: MyHulk(
                      HulkDirection: hulkDirection,
                      HulkSprintCount: hulkSprintCount % 2 + 1,
                    ),
                  ),
                  Container(
                    color: loadingScreenColor,
                    child: Center(
                      child: Text(
                        loadingTime.toString(),
                        style: TextStyle(color: loadingScreenTextColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            color: Colors.green[600],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Expanded(
              child: Container(
                color: Colors.grey[250],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'M A P L E   S T O R Y',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        MyButton(
                          text: 'P L A Y',
                          function: () {
                            playNow();
                          },
                        ),
                        MyButton(
                          text: 'A T T A C K',
                          function: attack,
                        ),
                        MyButton(
                          text: '←',
                          function: () {
                            moveLeft();
                          },
                        ),
                        MyButton(
                          text: '↑',
                          function: () {
                            jump();
                          },
                        ),
                        MyButton(
                          text: '→',
                          function: () {
                            moveRight();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
