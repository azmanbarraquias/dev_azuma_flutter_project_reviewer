import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction({super.key, required this.addNewTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Title",
              contentPadding: EdgeInsets.all(10),
            ),
            controller: titleController,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Amount",
            ),
            controller: amountController,
          ),
          TextButton(
              onPressed: () => addNewTransaction(
                  titleController.text, amountController.text),
              child: const Text(
                "Add Transaction",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.purple,
                ),
              ))
        ],
      ),
    );
  }
}
