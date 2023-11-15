import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transactions.dart';

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
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<Transaction> transactionsList = [
    Transaction(
        id: 't1',
        title: 'New Adidas',
        amount: 122.52,
        dateTime: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'New Shoes1',
        amount: 122.52,
        dateTime: DateTime.now()),
    Transaction(
        id: 't3',
        title: 'New Nike 12',
        amount: 121.52,
        dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            children: transactionsList.map((e) {
              return Card(
                child: Row(
                  children: [
                    Container(
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
          )
        ],
      ),
    );
  }
}
