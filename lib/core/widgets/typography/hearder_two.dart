import 'package:flutter/material.dart';

class HeaderTwo extends StatelessWidget {
  final String text;
  final bool? primary;

  const HeaderTwo({
    Key? key,
    required this.text,
    this.primary,
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      color: primary == true ? Colors.pink : null,
    )
  ); 
}
