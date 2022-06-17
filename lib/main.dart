// import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import './models/dealings.dart';

import './widgets/dealings_list.dart';
import './widgets/new_dealing.dart';
import './models/dealings.dart';
import './widgets/chart.dart';

void main() => runApp(AtSabo());

class AtSabo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabo Exp',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        fontFamily: 'Economica',
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )
            //   fontFamily: 'Economica'),
            ),
      ),
    );
  }
}

// class Test {
// String beejay;
// Test(this.beejay);

String Beejay = 'testing';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Dealing> _userDealings = [
    // Dealing(
    //   tag: 'B1',
    //   amountSpent: 5000,
    //   date: DateTime.now(),
    //   itemName: 'Data',
    // ),
    // Dealing(
    //   tag: 'B2',
    //   amountSpent: 2000,
    //   date: DateTime.now(),
    //   itemName: 'Facecap',
    // ),
    // Dealing(
    //   tag: 'B3',
    //   amountSpent: 500,
    //   date: DateTime.now(),
    //   itemName: 'Snacks',
    // ),
  ];

  List<Dealing> get _dealingsForChart {
    return _userDealings.where((dealing) {
      return dealing.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _includeNewDealing(String itemName, double amountSpent) {
    final newDealings = Dealing(
      tag: DateTime.now().toString(),
      amountSpent: amountSpent,
      date: DateTime.now(),
      itemName: itemName,
    );

    setState(() {
      _userDealings.add(newDealings);
    });
  }

  void _forModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewDealing(_includeNewDealing);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Sabo Exp',
            style: TextStyle(fontFamily: 'Economica'),
          ),
          // actions: [
          // IconButton(
          //  onPressed: () => _forModalBottomSheet(context),
          // icon: Icon(Icons.add_circle_outline_rounded),
          // ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
               // width: 300,
                height: 200,
                child: MyChart(_dealingsForChart),
              ),
              DealingsList(_userDealings),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () => _forModalBottomSheet(context),
          child: Icon(Icons.add_circle_outline_rounded),
        ));
  }
}
