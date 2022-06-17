import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/dealings.dart';

class DealingsList extends StatelessWidget {
  final List<Dealing> dealings;

  DealingsList(this.dealings);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: dealings.isEmpty
          ? Column(
              children: [
                Text(
                  'ADD A DEALING!',
                  style: TextStyle(fontSize: 21, fontFamily: 'Economica'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 310,
                  child: Image.asset(
                      'images/20220512_102522.jpg', //'images/IMG_20210514_210635.jpg',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            'N ${dealings[index].amountSpent}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      dealings[index].itemName,
                      style: TextStyle(
                        //  fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(dealings[index].date),
                    ),
                  ),
                );
              },
              itemCount: dealings.length,
            ),
    );
  }
}
