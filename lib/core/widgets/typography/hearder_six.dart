import 'package:flutter/material.dart';

class HeaderSix extends StatelessWidget {
  final String text;
  final Color? color;
  final bool? primary;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLines;
  final double fontSize;

  const HeaderSix({
    Key? key,
    required this.text,
    this.primary,
    this.color = Colors.black87,
    this.weight = FontWeight.w400,
    this.textAlign,
    this.overflow,
    this.maxLines = 1,
    this.fontSize = 18
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontFamily: 'HelveticaNeue',
      fontWeight: weight,
      color: primary == true ? Colors.pink : color,
      overflow: overflow,
    ),
    maxLines: maxLines,
    textAlign: textAlign,
  ); 
}