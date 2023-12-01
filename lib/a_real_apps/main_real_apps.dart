import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transactions.dart';
import 'widgets/chart.dart';
import 'widgets/new_transactions.dart';
import 'widgets/transaction_list.dart';

/* DateTime intl
https://api.flutter.dev/flutter/intl/DateFormat-class.html
*/
void main() {
// WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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

  bool _showChart = false;

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
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenOrientation = MediaQuery.of(context).orientation;
    final appBar = AppBar(
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
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startAddNewTransaction(context);
        },
        child: const Icon(Icons.add),
      ),
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (screenOrientation == Orientation.landscape)
                Column(
                  children: [
                    SizedBox(
                      height: (screenHeight -
                              appBar.preferredSize.height -
                              statusBarHeight) *
                          0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (screenOrientation == Orientation.landscape)
                            const Text("Show Chart"),
                          Switch(
                              value: _showChart,
                              onChanged: (val) {
                                setState(() {
                                  _showChart = val;
                                });
                              })
                        ],
                      ),
                    ),
                    _showChart
                        ? chartBar(screenHeight, appBar, statusBarHeight, 0.85)
                        : transactionList(
                            screenHeight, appBar, statusBarHeight, 0.85),
                  ],
                ),
              if (screenOrientation == Orientation.portrait)
                Column(
                  children: [
                    chartBar(screenHeight, appBar, statusBarHeight, 0.3),
                    transactionList(screenHeight, appBar, statusBarHeight, 0.7),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox chartBar(
      double screenHeight, AppBar appBar, double statusBarHeight, double size) {
    return SizedBox(
        height: (screenHeight - appBar.preferredSize.height - statusBarHeight) *
            size,
        child: Chart(recentTransactions: _recentTransactions));
  }

  SizedBox transactionList(
      double screenHeight, AppBar appBar, double statusBarHeight, double size) {
    return SizedBox(
      height:
          (screenHeight - appBar.preferredSize.height - statusBarHeight) * size,
      child: TransactionList(
        transactionsList: _userTransaction,
        deleteUser: _deleteTransaction,
      ),
    );
  }
}
