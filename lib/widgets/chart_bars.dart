import 'package:flutter/material.dart';

class MyBars extends StatelessWidget {
  final String dayLabel;
 //  final double spentAmount;
  final double totalAmountPercentage;
  MyBars(
   this.dayLabel,
  // this.spentAmount,
   this.totalAmountPercentage,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dayLabel),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 65,
          width: 11,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalAmountPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      //  Text('N ${spentAmount.toStringAsFixed(0)}')
      ],
    );
  }
}
