import 'package:dev_azuma/a_basics/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'new_transactions.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(title: 'New Adidas', amount: 122.52, dateTime: DateTime.now()),
    Transaction(title: 'New Shoes1', amount: 122.52, dateTime: DateTime.now()),
    Transaction(title: 'New Nike 12', amount: 121.52, dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction: _addNewTransaction),
        Card(
          margin: const EdgeInsets.all(10),
          color: Colors.yellow,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: const Text(
              "List of Transaction",
            ),
          ),
        ),
        TransactionList(transactionsList: _userTransaction),
      ],
    );
  }

  void _addNewTransaction(String title, String amount) {
    final newTransaction = Transaction(
        title: title, amount: double.parse(amount), dateTime: DateTime.now());
    setState(() {
      _userTransaction.add(newTransaction);
    });
    print('Good');
  }
}
