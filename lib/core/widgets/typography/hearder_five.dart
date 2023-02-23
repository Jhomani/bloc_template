import 'package:flutter/material.dart';

class HeaderFive extends StatelessWidget {
  final String text;
  final bool? primary;
  final Color? color;
  final FontWeight? weight;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const HeaderFive({
    super.key,
    required this.text,
    this.primary,
    this.color = Colors.black87,
    this.letterSpacing,
    this.weight,
    this.overflow,
    this.maxLines,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 22,
      fontWeight: weight ,
      color: primary == true ? Colors.pink : color,
      letterSpacing: letterSpacing,
      overflow: overflow,
    ),
    textAlign: textAlign,
    maxLines: maxLines,
  ); 
}
