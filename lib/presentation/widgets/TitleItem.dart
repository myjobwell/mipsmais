import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const TitleItem({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
