import 'package:flutter/widgets.dart';

abstract class BaseGridWidget extends StatelessWidget {
  final double gap;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final List<Widget?> children;

  const BaseGridWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    required this.children,
    this.gap = 0, 
  });

  List<Widget> get cleanedChildren {
    List<Widget> cleaned  = []; 

    for (Widget? element in children) {
      if(element != null) cleaned.add(element);
    } 

    for(int i = 0; i < cleaned.length; i++) {
      if(i % 2 != 0) cleaned.insert(i, SizedBox(height: gap));
    }

    return cleaned;
  }
}
