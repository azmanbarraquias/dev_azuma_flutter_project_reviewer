import 'dart:ui';

import 'package:dev_azuma/x_experiment/flutter_lifecycle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'MyPage';

  @override
  State<MyPage> createState() => _MyPageState();
}

List<String> words = [
  '123A43',
  '12ABC3',
  '4321',
  '4321',
  '4321',
  '12',
  '143'
      '5List22',
  '143hehe',
  'yowatashowa'
      'NIGGA'
];




class _MyPageState extends State<MyPage> {


  @override
  Widget build(BuildContext context) {
    final mod = [...words]..sort((a, b) => a.length.compareTo(b.length));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          // Start Here
          child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: mod.map((word) => Chip(label: Text(word))).toList()),
        ),
      ),
    );
  }


}