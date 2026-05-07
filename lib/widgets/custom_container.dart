import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Color? color;
  final double padding;
  final double margin;
  final double borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Widget child;
  final double? width;
  final double? height;
  final bool animate;

  const CustomContainer({
    super.key,
    this.color,
    this.padding = 20.0,
    this.margin = 10.0,
    this.borderRadius = 12.0,
    this.borderWidth,
    this.borderColor,
    this.width,
    this.height,
    this.animate = true,
    required this.child,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color background =
        widget.color ?? Theme.of(context).colorScheme.surfaceContainer;
    final Color resolvedBorderColor =
        widget.borderColor ?? Theme.of(context).dividerColor;

    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: EdgeInsets.all(widget.margin),
          padding: EdgeInsets.all(widget.padding),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border:
                widget.borderWidth != null
                    ? Border.all(
                      width: widget.borderWidth!,
                      color: resolvedBorderColor,
                    )
                    : null,
          ),
          clipBehavior: Clip.hardEdge,
          child: widget.child,
        ),
      ),
    );
  }
}
