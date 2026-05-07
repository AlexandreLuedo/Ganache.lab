import 'package:flutter/material.dart';

class AnimatedCountText extends StatelessWidget {
  final double value;
  final String suffix;
  final int decimals;
  final TextStyle? style;
  final Duration duration;

  const AnimatedCountText({
    super.key,
    required this.value,
    this.suffix = "",
    this.decimals = 1,
    this.style,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, val, child) {
        return Text(
          "${val.toStringAsFixed(decimals)}$suffix",
          style: style,
        );
      },
    );
  }
}
