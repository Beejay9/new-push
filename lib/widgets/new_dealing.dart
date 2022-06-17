import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewDealing extends StatefulWidget {
  final Function newExpense;

  NewDealing(this.newExpense);

  @override
  State<NewDealing> createState() => _NewDealingState();
}

class _NewDealingState extends State<NewDealing> {
  DateFormat selectedDate = DateFormat();

  @override
  State<NewDealing> createState() => _NewDealingState();

  void forTextfields() {
    final itemNameEntered = itemNameController.text;
    final amountSpentEntered = double.parse(amountSpentController.text);

    if (itemNameEntered.isEmpty || amountSpentEntered <= 0) {
      return;
    }

    widget.newExpense(
      itemNameEntered,
      amountSpentEntered,
    );

    Navigator.of(context).pop();
  }

  void forDateSelection() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2023))
        .then((value) {
      if (value == null) {
        return;
      }
    //   setState(() {
    // //    selectedDate = value;
    //   });
    });
  }

  final itemNameController = TextEditingController();

  final amountSpentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                  labelText: 'itemname',
                ),
                controller: itemNameController,
                onSubmitted: (_) => forTextfields
                // onChanged: (detail) => itemNameInput,
                ),
            TextField(
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                  labelText: 'amountSpent',
                ),
                controller: amountSpentController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => forTextfields
                //  onChanged: (detail) => amountSpentInput,
                ),
            // Row(
            //   children: [
            //     Text(
            //       selectedDate == null
            //           ? 'No Date Selected'
            //           : DateFormat.yMMMEd().format(selectedDate),
            //     ),
            //     TextButton(
            //       onPressed: forDateSelection,
            //       child: Text('Select Date'),
            //     )
            //   ],
            // ),
            TextButton(
              onPressed: () => forTextfields(),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
