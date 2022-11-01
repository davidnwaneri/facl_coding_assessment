import 'package:flutter/material.dart';

class ExpandedView extends StatelessWidget {
  const ExpandedView({
    Key? key,
    required this.bgColour,
    required this.child,
  }) : super(key: key);

  final Color bgColour;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColour,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36, bottom: 30),
          child: child,
        ),
      ),
    );
  }
}
