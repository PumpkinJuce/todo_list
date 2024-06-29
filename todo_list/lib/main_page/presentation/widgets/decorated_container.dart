import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    required this.child,
    this.margin,
    this.width,
    this.padding,
    super.key,
  });
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.secondary,
      ),
      margin: margin,
      width: width,
      padding: padding ?? const EdgeInsets.all(8),
      child: child,
    );
  }
}
