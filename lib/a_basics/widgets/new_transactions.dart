import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  const NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            onSubmitted: (_) => submitData(),
            decoration: const InputDecoration(
              labelText: "Title",
              contentPadding: EdgeInsets.all(10),
            ),
            controller: titleController,
          ),
          TextField(
            onSubmitted: (_) => submitData(),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Amount",
            ),
            controller: amountController,
          ),
          TextButton(
              onPressed: () => submitData(),
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

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    widget.addNewTransaction(titleController.text, amountController.text);
    Navigator.of(context).pop();
  }
}
