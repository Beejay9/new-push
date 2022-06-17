import 'package:flutter/material.dart';

class Dealing {
  final String tag;
  final String itemName;
  final double amountSpent;
  final DateTime date;

  Dealing({
    required this.tag,
    required this.amountSpent,
    required this.date,
    required this.itemName,
  });
}
