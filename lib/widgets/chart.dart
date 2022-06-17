// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chart_bars.dart';
import '../models/dealings.dart';

class MyChart extends StatelessWidget {
  final List<Dealing> newlyAddedDealing;
  MyChart(this.newlyAddedDealing);

  List<Map<String, Object>> get forChart {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
    double totalSpent = 0;

      for (var i = 0; i < newlyAddedDealing.length; i++) {
        if (newlyAddedDealing[i].date.day == weekDay.day &&
            newlyAddedDealing[i].date.month == weekDay.month &&
            newlyAddedDealing[i].date.year == weekDay.year) {
          totalSpent += newlyAddedDealing[i].amountSpent;
        }
      }

      return {
        'dayKey': DateFormat.E().format(weekDay),
        'amountKey': totalSpent,
      };
    }).reversed.toList();
  }

  double get totalAmountSpent {
    return forChart.fold(0.0, (sum, element) {
      return sum + (element['amountKey'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: EdgeInsets.all(15),
      child: Row(
          children: forChart.map(
        (chart) {
          return MyBars(
            chart['dayKey'] as String,
          //  00,
            (chart['amountKey'] as double) / totalAmountSpent,
          );
        },
      ).toList()),
    );
  }
}
