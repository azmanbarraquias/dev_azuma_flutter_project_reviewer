import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactionsList});

  final List<Transaction> transactionsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 300,
      child: ListView(
        children: transactionsList.map((e) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 80,
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Text(
                    '\$${e.amount}',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy hh:mm aa').format(e.dateTime),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
