import 'package:flutter/material.dart';

class ListItem {
  final Widget? leading;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final bool isClickable;
  final void Function(BuildContext context)? onTap;

  ListItem({
    this.leading,
    required this.title,
    this.trailing,
    this.subtitle = '',
    this.isClickable = true,
    this.onTap,
  });
}

class CustomContainerItem {
  final String title;
  final String subtitle;
  final IconData? icon;
  final Color? color;
  final void Function()? onTap;

  CustomContainerItem({
    required this.title,
    required this.subtitle,
    this.icon,
    this.color,
    this.onTap,
  });
}