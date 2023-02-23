import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  final String text;
  final bool? primary;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? weight;

  const Caption({
    Key? key,
    required this.text,
    this.primary,
    this.color = Colors.black54,
    this.weight = FontWeight.w400,
    this.overflow,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontWeight: weight,
      overflow: overflow,
      color: primary == true
        ? Colors.pink
        : color,
    )
  ); 
}