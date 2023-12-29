import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteUser,
  });

  final Transaction transaction;
  final Function deleteUser;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColors;

  @override
  void initState() {
    const availableColors = [Colors.red, Colors.blue, Colors.green];

    _bgColors = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      elevation: 5,
      child: ListTile(
        title:
        Text('${widget.transaction.userID} ${widget.transaction.title
            .capitalizeFirst}'),
        subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm aa').format(
                widget.transaction.dateTime)),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 360
            ? ElevatedButton.icon(
            onPressed: () => {widget.deleteUser(widget.transaction.userID)},
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                        (states) =>
                    Theme
                        .of(context)
                        .colorScheme
                        .primary)),
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            label: const Text('Delete'))
            : IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme
                  .of(context)
                  .errorColor,
            ),
            onPressed: () => {widget.deleteUser(widget.transaction.userID)}),
        leading: CircleAvatar(
        backgroundColor: _bgColors,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
      ),
    );
  }
}
