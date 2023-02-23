import 'package:flutter/material.dart';

class HeaderThree extends StatelessWidget {
  final String text;
  final bool? primary;
  final Color? color;

  const HeaderThree({
    Key? key,
    required this.text,
    this.primary,
    this.color
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: primary == true ? Colors.pink : color,
    )
  ); 
}
