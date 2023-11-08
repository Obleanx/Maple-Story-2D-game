// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, non_constant_identifier_names
// ignore: unused_import
import 'dart:math';
import 'package:flutter/material.dart';

class MyHulk extends StatelessWidget {
  MyHulk({required this.HulkSprintCount, required this.HulkDirection});

  final int HulkSprintCount;
  final String HulkDirection;

  @override
  Widget build(BuildContext context) {
    if (HulkDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        width: 100,
        child: Image.asset('lib/images/actor1.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 100,
          child: Image.asset('lib/images/actor1.png'),
        ),
      );
    }
  }
}
