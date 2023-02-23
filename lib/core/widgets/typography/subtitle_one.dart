import 'package:flutter/material.dart';

class SubtitleOne extends StatelessWidget {
  final String text;
  final bool? primary;
  final TextOverflow? overflow;
  final double? size;
  final TextAlign? align;
  final FontWeight? weight;
  final Color? color;

  const SubtitleOne({
    Key? key,
    required this.text,
    this.primary,
    this.overflow,
    this.size,
    this.align,
    this.weight = FontWeight.w600,
    this.color = Colors.black87,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    overflow: overflow,
    style: TextStyle(
      fontSize: size ?? 14,
      fontWeight: weight,
      color: primary == true ? Colors.pink : color,
    ),
    textAlign: align,
  ); 
}
