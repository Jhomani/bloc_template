import 'package:flutter/material.dart';

class AppTypography {
  static Widget body(String text) => Text(
    text,
    style: const TextStyle(fontSize:16)
  );

  static Widget caption(String text, {primary= true}) => Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: primary == true
        ? Colors.blue
        : Colors.black54,
    )
  );

  static Widget subTitleOne(
    String text,
    {
      primary = false,
      double size = 14,
      color = Colors.black
    }
  ) => Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: primary == true
        ? Colors.blue
        : Colors.black87,
    )
  );

}
