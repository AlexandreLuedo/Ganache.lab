import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import '../utils/email_helper.dart';

// TODO add all data containers here

/// List who store the containers data's with some options.
final List<CustomContainerItem> customContainerItems = [
  CustomContainerItem(
    /// Used in settings
    title: 'Contact',
    subtitle: 'hadrien.ganache@pm.me',
    icon: Symbols.mail,
    color: Colors.amber,
    onTap: openEmail,
  ),
  CustomContainerItem(
    /// License
    title: 'Licence',
    subtitle: 'Propriétaire',
    icon: Symbols.license,
    color: Colors.green,
    onTap: () {
      // Action navigation or other
    },
  ),
  CustomContainerItem(
    /// License
    title: 'Licence',
    subtitle: 'Propriétaire',
    icon: Symbols.license,
    color: Colors.green,
    onTap: () {
      // action navigation or other
    },
  ),
];
