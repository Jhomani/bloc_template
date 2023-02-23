import 'package:flutter/material.dart';

class SubtitleTwo extends StatelessWidget {
  final String text;
  final bool? primary;
  final TextAlign? align;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? weight;

  const SubtitleTwo({
    Key? key,
    this.align,
    this.primary,
    this.overflow,
    required this.text,
    this.color = Colors.black87,
    this.weight = FontWeight.w600,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    textAlign: align,
    overflow: overflow,
    style: TextStyle(
      fontSize: 15,
      fontWeight: weight,
      color: primary == true ? Colors.pink : color,
    )
  );
}