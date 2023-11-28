import 'package:flutter/material.dart';

import 'models/transactions.dart';
import 'widgets/chart.dart';
import 'widgets/new_transactions.dart';
import 'widgets/transaction_list.dart';

/* DateTime intl
https://api.flutter.dev/flutter/intl/DateFormat-class.html
*/
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Personal Expenses",
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.red, fontFamily: 'Hipsters', fontSize: 25)),
          primarySwatch: Colors.purple,
          hintColor: Colors.red,
          fontFamily: 'OpenSans'),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(title: 'New Shoes', amount: 99.99, dateTime: DateTime.now()),
    // Transaction(title: 'Groceries', amount: 9.69, dateTime: DateTime.now()),
    // Transaction(title: 'New Nike 12', amount: 121.52, dateTime: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.dateTime.isAfter(
        DateTime.now().subtract(const Duration(days: 7)),
      );
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(addNewTransaction: _addNewTransaction));
        });
  }

  void _addNewTransaction(String title, String amount, DateTime chosenDate) {
    final newTransaction = Transaction(
        title: title, amount: double.parse(amount), dateTime: chosenDate);
    setState(() {
      _userTransaction.add(newTransaction);
    });
    print('Good');
  }

  void _deleteTransaction(int id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.userID == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: const Icon(
                Icons.add,
              ))
        ],
        title: const Text("Personal Expenses"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
              transactionsList: _userTransaction,
              deleteUser: _deleteTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
