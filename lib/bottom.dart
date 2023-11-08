// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyButton({super.key, this.text, this.function});
  final text;
  final function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: function,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[700],
            child: Center(
              child: Text(
                text,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
