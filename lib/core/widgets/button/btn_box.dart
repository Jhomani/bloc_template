import 'package:flutter/material.dart';
import 'package:template/core/widgets/typography_widget.dart';

class SwButtonBox extends StatelessWidget {
  final Function()? onPress;
  final String text;

  const SwButtonBox({
    super.key,
    required this.text,
    this.onPress,
  });

@override
Widget build(BuildContext context) => SizedBox.fromSize(
  size: const Size(130, 120),
  child: Material(
    color: const Color(0xFFEAEEF0),
    borderRadius: BorderRadius.circular(10), 
    clipBehavior: Clip.hardEdge,
    child: InkWell(
      splashColor: Colors.black12,
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SwTypography.subTitleOne(
            text,
            color: const Color(0xFF243656),
          ),
        ),
      ),
    ),
  ),
  );
}
