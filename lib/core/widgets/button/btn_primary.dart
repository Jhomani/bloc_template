import 'package:flutter/material.dart';
import 'package:template/core/widgets/button/state_models.dart';
import 'package:template/core/widgets/typography_widget.dart';

class SwButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final IconData? icon;
  final bool danger;
  final BtnColor color;

  const SwButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.danger = false,
    this.color = BtnColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color background = btnColorMap[color]![BtnColorMapKey.background]!;
    Color foreground = btnColorMap[color]![BtnColorMapKey.foreground]!;

    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: foreground,
          shape: const StadiumBorder(), // round btn
          elevation: 0,
          disabledBackgroundColor: background.withOpacity(0.38),
          disabledForegroundColor: foreground.withOpacity(0.38) 
        ),
        child: SwTypography.buttonLarge(text),
      ) 
    );
  }
}
