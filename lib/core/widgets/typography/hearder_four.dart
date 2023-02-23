import 'package:flutter/material.dart';

class HeaderFour extends StatelessWidget {
  final String text;
  final bool? primary;
  final Color? color;
  final FontStyle? transform;
  final FontWeight? bold;
  final TextAlign? textAlign;

  const HeaderFour({
    Key? key,
    required this.text,
    this.primary,
    this.color = Colors.black87,
    this.transform,
    this.bold = FontWeight.w700,
    this.textAlign
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 24,
      fontWeight: bold,
      color: primary == true ? Colors.pink : color,
      fontStyle: transform
    ),
    textAlign: textAlign,
  ); 
}
