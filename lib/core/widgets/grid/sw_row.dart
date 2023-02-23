import 'package:flutter/widgets.dart';
import 'sw_base_grid.dart';

class SwRow extends BaseGridWidget {

  const SwRow({
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
    return SwRow(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      children: cleanedChildren,
    );
  } 
}
