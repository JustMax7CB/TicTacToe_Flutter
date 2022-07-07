import 'package:flutter/cupertino.dart';

class Cell {
  String value;
  Color bgColor;
  Cell({required this.value, required this.bgColor});

  String getValue() => value;
  Color getColor() => bgColor;
}
