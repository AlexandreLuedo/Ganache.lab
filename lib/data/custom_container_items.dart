import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import '../utils/email_helper.dart';

final List<CustomContainerItem> customContainerItems = [
  CustomContainerItem(
    title: 'Contact',
    subtitle: 'hadrien.ganache@pm.me',
    icon: Symbols.mail,
    color: Colors.amber,
    onTap: openEmail,
  ),
  CustomContainerItem(
    title: 'Licence',
    subtitle: 'Propriétaire',
    icon: Symbols.license,
    color: Colors.green,
    onTap: () {
      // action navigation ou autre
    },
  ),
];
