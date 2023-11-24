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
      child: transactionsList.isEmpty
          ? Column(
              children: [
                const Text('No Transaction added yet!',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/pls_wait.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    title: Text('${transactionsList[index].title}'),
                    subtitle: Text(DateFormat('dd/MM/yyyy hh:mm aa')
                        .format(transactionsList[index].dateTime)),
                    trailing:  Icon(Icons.delete, color: Theme.of(context).errorColor,),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactionsList[index].amount}')),
                      ),
                    ),
                  ),
                );
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        child: Text(
                          '\$${transactionsList[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionsList[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy hh:mm aa')
                                .format(transactionsList[index].dateTime),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
