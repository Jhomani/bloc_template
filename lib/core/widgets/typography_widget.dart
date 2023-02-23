import 'package:flutter/widgets.dart';

class TypographyBase extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? lineHeight;
  final double fontSize;

  const TypographyBase({
    super.key,
    required this.text,
    this.color = const Color(0xDD000000),
    this.weight = FontWeight.w400,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.lineHeight,
    this.fontSize = 16
  });

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: weight,
      color: color,
      overflow: overflow,
    ),
    maxLines: maxLines,
    textAlign: textAlign,
  ); 
}

class SwTypography extends TypographyBase {

  const SwTypography({
    super.key,
    required super.text,
    super.color,
    super.weight,
    super.textAlign,
    super.overflow,
    super.maxLines,
    super.fontSize,
    super.lineHeight
  });

  factory SwTypography.headerOne(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 40,
    lineHeight: 1.25,
    color: color,
    weight: FontWeight.bold,
  );

  factory SwTypography.headerTwo({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 32,
    lineHeight: 1.315,
    color: color,
    weight: FontWeight.bold,
  );

  factory SwTypography.headerTree({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 24,
    lineHeight: 1.385,
    color: color,
    weight: FontWeight.bold,
  );

  factory SwTypography.headerFour(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 20,
    lineHeight: 1.5,
    color: color,
    weight: FontWeight.bold,
  );

  factory SwTypography.headerFive({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 18,
    lineHeight: 27,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.headerSix({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 17,
    lineHeight: 26,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleOne({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 16,
    lineHeight: 28,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleTwo({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 14,
    lineHeight: 26,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleTree({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 13,
    lineHeight: 24,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.bodyOne({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 16,
    lineHeight: 28,
    color: color,
    weight: FontWeight.normal,
  );

  factory SwTypography.bodyTwo({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 14,
    lineHeight: 26,
    color: color,
    weight: FontWeight.normal,
  );

  factory SwTypography.bodyThree({
    required String text,
    Color? color,
  }) => SwTypography(
    text: text,
    fontSize: 13,
    lineHeight: 24,
    color: color,
    weight: FontWeight.normal,
  );

  factory SwTypography.caption(
    String text,
    { Color? color }
  ) => SwTypography(
    text: text,
    fontSize: 12,
    lineHeight: 1.667,
    color: color,
    weight: FontWeight.normal,
  );
}
