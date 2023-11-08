// ignore_for_file: sized_box_for_whitespace, unnecessary_brace_in_string_interps

import 'dart:math';
import 'package:flutter/material.dart';

class BlackDragon extends StatelessWidget {
  const BlackDragon({
    Key? key,
    required this.dragonDirection,
    required this.dragonSprintCount,
  }) : super(key: key);

  final int
      dragonSprintCount; // Specify the data type (int) for dragonSprintCount
  final String dragonDirection;

  @override
  Widget build(BuildContext context) {
    if (dragonDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset('lib/images/bose1.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          height: 50,
          width: 50,
          child: Image.asset('lib/images/bose1.png'),
        ),
      );
    }
  }
}
