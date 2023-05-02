import 'package:flutter/widgets.dart';

class _TypographyBase extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? lineHeight;
  final double fontSize;

  const _TypographyBase({
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

class SwTypography extends _TypographyBase {
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
    lineHeight: 1.529,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleOne(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 16,
    lineHeight: 1.75,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleTwo(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 14,
    lineHeight: 1.857,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.subTitleTree(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 13,
    lineHeight: 24,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.bodyOne(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 16,
    lineHeight: 28,
    color: color,
    weight: FontWeight.normal,
  );

  factory SwTypography.bodyTwo(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 14,
    lineHeight: 1.857,
    color: color,
    weight: FontWeight.normal,
  );

  factory SwTypography.buttonLarge(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 15,
    lineHeight: 1.733,
    color: color,
    weight: FontWeight.w600,
  );

  factory SwTypography.buttonMedium(
    String text,
    {Color? color}
  ) => SwTypography(
    text: text,
    fontSize: 14,
    lineHeight: 1.714,
    color: color,
    weight: FontWeight.w600,
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
