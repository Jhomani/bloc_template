import 'package:flutter/material.dart';
import 'grid/sw_column.dart';

class BasicScroll extends StatefulWidget {
  final EdgeInsets? padding;
  final List<Widget?> children;
  final MainAxisAlignment mainAlignment;
  final CrossAxisAlignment crossAlignment;
  final double gap;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior; 

  const BasicScroll({
    Key? key,
    required this.children,
    this.padding,
    this.gap = 0,
    this.mainAlignment = MainAxisAlignment.start,
    this.crossAlignment = CrossAxisAlignment.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  }): super(key: key);

  @override
  State<BasicScroll> createState() => _BasicScrollState();
}

class _BasicScrollState extends State<BasicScroll> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // _controller.addListener(() {
    //   log("Scrolling");
    //   FocusManager.instance.primaryFocus?.unfocus();
    //   if(offset != scrollController.offset) {
    //     FocusScope.of(context).unfocus();
    //   }
    // });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    keyboardDismissBehavior: widget.keyboardDismissBehavior,
    controller: _controller,
    padding: widget.padding,
    child: SwColumn(
      gap: widget.gap,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: widget.mainAlignment,
      crossAxisAlignment: widget.crossAlignment,
      children: widget.children,
    ),
  );
}
