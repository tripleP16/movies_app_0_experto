import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.0, 0.4],
                begin: Alignment.topLeft,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ])));
  }
}
