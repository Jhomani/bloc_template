import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final Widget header;
  final Widget body;

  const Accordion({
    Key? key,
    required this.header,
    required this.body,
  }): super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool opened = false;

  @override
  Widget build(BuildContext context) => Column (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {setState(() { opened = !opened; }); },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: widget.header,
              ),
              const SizedBox(width: 10),
              Icon(
                opened ? Icons.remove : Icons.add,
                size: 30,
                color: Colors.blue
              ),
            ],
          ),
        ),
      ),
      const Divider(
        height: 1,
        thickness: 1,
        color: Colors.black45,
      ),
      AnimatedCrossFade(
        firstChild: Container(height: 0.0),
        secondChild: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: widget.body,
        ),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: opened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400),
      ),
    ],
  );
}
