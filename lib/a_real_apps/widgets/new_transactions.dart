import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CupertinoTextField(
              onSubmitted: (_) => _submitData(),
              placeholder: "Title",
              controller: titleController,
            ),
            TextField(
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Amount",
              ),
              controller: amountController,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? "No Date Chosen!"
                    : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AdaptiveButton(
              content: 'Add Transaction',
              handler: _submitData,
            )
          ],
        ),
      ),
    );
  }

  void _submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(
        titleController.text, amountController.text, _selectedDate);
    Navigator.of(context).pop();
  }

  _showDatePicker() {
    print('Date Picker Show');
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      print('You select ${DateFormat.yMd().format(value!)}');
      if (value == null) {
        print('No Date Selected');
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }
}
