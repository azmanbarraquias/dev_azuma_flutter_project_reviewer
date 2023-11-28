import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            onSubmitted: (_) => _submitData(),
            decoration: const InputDecoration(
              labelText: "Title",
              contentPadding: EdgeInsets.all(10),
            ),
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
          ElevatedButton(
              onPressed: () => _submitData(),
              child: const Text(
                "Add Transaction",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ],
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
