import 'dart:io';

import 'package:flutter/cupertino.dart';
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
    // Platform.isIOS
    //     ? const CupertinoApp(
    //         home: MyHomePage(),
    //         debugShowCheckedModeBanner: false,
    //         title: "Personal Expenses",
    //         theme: CupertinoThemeData(primaryColor: Colors.red),
    //       )
    //     :
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

  Widget _buildLandscapeContent(Widget appBar, double screenHeight,
      double statusBarHeight, MediaQueryData mqd) {
    return Column(
      children: [
        SizedBox(
          height: (screenHeight -
                  (appBar as PreferredSizeWidget).preferredSize.height -
                  statusBarHeight) *
              0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (mqd.orientation == Orientation.landscape)
                const Text("Show Chart"),
              Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.primary,
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
            ? chartBar(screenHeight, (appBar).preferredSize.height,
                statusBarHeight, 0.85)
            : transactionList(screenHeight, (appBar).preferredSize.height,
                statusBarHeight, 0.85),
      ],
    );
  }

  List<SizedBox> _buildPortraitContent(Widget appBar, double screenHeight,
      double statusBarHeight, MediaQueryData mqd) {
    return [
      chartBar(
          screenHeight,
          (appBar as PreferredSizeWidget).preferredSize.height,
          statusBarHeight,
          0.3),
      transactionList(
          screenHeight, (appBar).preferredSize.height, statusBarHeight, 0.7),
    ];
  }

  Widget _buildAppBar() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: const CupertinoThemeData().primaryColor,
            middle: const Text("Personal Expenses"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _startAddNewTransaction(context);
                  },
                  child: const Icon(
                    CupertinoIcons.add,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )
        : AppBar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            actions: [
              IconButton(
                  onPressed: () {
                    _startAddNewTransaction(context);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ))
            ],
            title: const Text("Personal Expenses"),
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBarHeight = mediaQuery.padding.top;
    final screenHeight = mediaQuery.size.height;
    final screenOrientation = mediaQuery.orientation;

    final Widget appBar = _buildAppBar();

    final pageBody = SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (screenOrientation == Orientation.landscape)
                _buildLandscapeContent(
                    appBar, screenHeight, statusBarHeight, mediaQuery),
              if (screenOrientation == Orientation.portrait)
                ..._buildPortraitContent(
                    appBar, screenHeight, statusBarHeight, mediaQuery),
            ],
          ),
        ),
      ),
    );

    return Platform.isIOS
        ? _buildCupertinoPageScaffoldAppBar(appBar, pageBody)
        : _buildScaffoldAppBar(context, appBar, pageBody);
  }

  Widget _buildScaffoldAppBar(
      BuildContext context, Widget appBar, SafeArea pageBody) {
    return Scaffold(
        floatingActionButton: Platform.isIOS
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  _startAddNewTransaction(context);
                },
                child: const Icon(Icons.add),
              ),
        appBar: appBar as AppBar,
        body: pageBody);
  }

  Widget _buildCupertinoPageScaffoldAppBar(Widget appBar, SafeArea pageBody) {
    return CupertinoPageScaffold(
      navigationBar: appBar as CupertinoNavigationBar,
      child: pageBody,
    );
  }

  SizedBox chartBar(double screenHeight, double appBarHeight,
      double statusBarHeight, double size) {
    return SizedBox(
        height: (screenHeight - appBarHeight - statusBarHeight) * size,
        child: Chart(recentTransactions: _recentTransactions));
  }

  SizedBox transactionList(double screenHeight, double appBarHeight,
      double statusBarHeight, double size) {
    return SizedBox(
      height: (screenHeight - appBarHeight - statusBarHeight) * size,
      child: TransactionList(
        transactionsList: _userTransaction,
        deleteUser: _deleteTransaction,
      ),
    );
  }
}
