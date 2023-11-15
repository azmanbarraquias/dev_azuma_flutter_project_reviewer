import 'package:dev_azuma/a_basics/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transactions.dart';
import 'widgets/user_transactions.dart';

/* DateTime intl
https://api.flutter.dev/flutter/intl/DateFormat-class.html
*/
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter App"),
        ),
        body: const SafeArea(
          child: MyHomePage(),
        ),
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Chart",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          const UserTransactions()
        ],
      ),
    );
  }
}
