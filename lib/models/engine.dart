import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/chip_ganache_type.dart';

int whatIsThisType = chocolateTypeValue;

if (chocolateTypeValue == 0) {
whatIsThisType = privateConfig['dark'];
} else if (chocolateTypeValue == 1) {
whatIsThisType = privateConfig['milk'];
}
