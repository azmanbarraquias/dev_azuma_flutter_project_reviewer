import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
      home: Scaffold(
        body: DropDownSample(),
      ),
    ));

class DropDownSample extends StatefulWidget {
  const DropDownSample({super.key});

  @override
  State<DropDownSample> createState() => _DropDownSampleState();
}

class _DropDownSampleState extends State<DropDownSample> {
  String _dropdownValue = '1';
  var _items = [
    '1',
    '2',
    '3',
    '4',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(),
      ),
    );
  }
}
