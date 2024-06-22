import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    required this.child,
    this.margin,
    super.key,
  });
  final Widget child;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.secondary,
      ),
      margin: margin,
      padding: const EdgeInsets.all(8),
      child: child,
    );
  }
}
