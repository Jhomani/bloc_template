import 'package:flutter/material.dart';

class BodyOne extends StatelessWidget {
  final String text;
  final Color? color; 
  final TextOverflow? overflow;
  final FontWeight? weight;
  final TextDecoration? decoration;
  final TextAlign? align;
  final int? maxLines;
  final double? fontSize;

  const BodyOne({
    super.key,
    required this.text,
    this.color = Colors.black87,
    this.overflow,
    this.weight = FontWeight.w500,
    this.decoration,
    this.maxLines,
    this.align = TextAlign.center,
    this.fontSize = 16
  });

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
      decoration: decoration
    ),
    textAlign: align,
    overflow: overflow,
    maxLines: maxLines,
  ); 
}
