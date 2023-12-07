import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteUser,
  });

  final Transaction transaction;
  final Function deleteUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 5,
      child: ListTile(
        title:
            Text('${transaction.userID} ${transaction.title.capitalizeFirst}'),
        subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm aa').format(transaction.dateTime)),
        trailing: MediaQuery.of(context).size.width > 360
            ? ElevatedButton.icon(
                onPressed: () => {deleteUser(transaction.userID)},
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary)),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                label: const Text('Delete'))
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => {deleteUser(transaction.userID)}),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
      ),
    );
  }
}
