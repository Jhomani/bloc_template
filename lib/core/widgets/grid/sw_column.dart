import 'package:flutter/widgets.dart';
import 'sw_base_grid.dart';

class SwColumn extends BaseGridWidget {

  const SwColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.verticalDirection,
    required super.children,
    super.gap = 0, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      children: cleanedChildren,
    );
  } 
}
