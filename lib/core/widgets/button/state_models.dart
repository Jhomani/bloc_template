import 'dart:ui';

import 'package:template/core/pallette.dart';

enum BtnVariant {
  outline,
  color,
}

enum BtnColor {
  danger,
  success,
  primary,
  secondary,
}

enum BtnColorMapKey {
  background,
  foreground,
}

typedef BtnColorMap = Map<BtnColorMapKey, Color>; 

Map<BtnColor, BtnColorMap> btnColorMap = {
  BtnColor.danger: {
    BtnColorMapKey.background: const Color(0xFFFE3E55),
    BtnColorMapKey.foreground: const Color(0xFFFFFFFF)
  },
  BtnColor.primary: {
    BtnColorMapKey.background:  Pallette.primary,
    BtnColorMapKey.foreground: const Color(0xFFFFFFFF)
  }
};
