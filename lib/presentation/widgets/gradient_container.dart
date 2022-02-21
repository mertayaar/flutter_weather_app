import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
    final Widget? child;
  final MaterialColor? color;
  const GradientContainer({
    Key? key,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Colors.red,
        gradient: LinearGradient(
          colors: [color!.shade700, color!.shade500, color!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.6, 0.8, 0.1],
        ),
      ),
    );
  }
}
