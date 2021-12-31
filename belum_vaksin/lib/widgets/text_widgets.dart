import 'package:flutter/material.dart';

// custom text widget
  Widget CustomText (String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 156, 54, 88),
      ),
    );
  }