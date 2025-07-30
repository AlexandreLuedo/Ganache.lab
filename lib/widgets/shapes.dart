import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

class MessageShapeBorder extends OutlinedBorder {
  final double borderRadius;
  final double weight;

  const MessageShapeBorder({
    super.side = BorderSide.none,
    this.borderRadius = 20.0,
    this.weight = 2.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r = borderRadius;
    return Path()
      ..moveTo(rect.left, rect.bottom)
      ..conicTo(rect.left + r, rect.bottom - r, rect.left + 2 * r, rect.top + r, weight)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom)
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect.deflate(side.width), textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = getOuterPath(rect, textDirection: textDirection);
    final paint = Paint()
      ..color = side.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = side.width;
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return MessageShapeBorder(
      side: side.scale(t),
      borderRadius: borderRadius * t,
      weight: weight * t,
    );
  }

  @override
  MessageShapeBorder copyWith({BorderSide? side, double? borderRadius, double? weight}) {
    return MessageShapeBorder(
      side: side ?? this.side,
      borderRadius: borderRadius ?? this.borderRadius,
      weight: weight ?? this.weight,
    );
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? other, double t) {
    if (other is MessageShapeBorder) {
      return MessageShapeBorder(
        side: BorderSide.lerp(side, other.side, t)!,
        borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
        weight: lerpDouble(weight, other.weight, t)!,
      );
    }
    return super.lerpTo(other, t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? other, double t) {
    if (other is MessageShapeBorder) {
      return MessageShapeBorder(
        side: BorderSide.lerp(other.side, side, t)!,
        borderRadius: lerpDouble(other.borderRadius, borderRadius, t)!,
        weight: lerpDouble(other.weight, weight, t)!,
      );
    }
    return super.lerpFrom(other, t);
  }
}
