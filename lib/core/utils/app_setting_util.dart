import 'package:flutter/services.dart';

void updateStatusBar({
  Color color = const Color.fromRGBO(0, 0, 0, 1),
  Brightness brightness = Brightness.light,
}) {
  // Color barColor = info.statusBarColor ?? Colors.black; 

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    )
  );
}
