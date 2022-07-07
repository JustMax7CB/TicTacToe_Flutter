// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TopText extends StatefulWidget {
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Its Turn",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: 2,
      ),
    );
  }
}
