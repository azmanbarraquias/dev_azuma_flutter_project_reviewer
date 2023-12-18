import 'package:dev_azuma/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SafeArea(child: MyPage()),
    ),
  ));
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.red,
        height: 50,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                Text('Header'),
                  ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 50,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(Utils.getRandomIconData());
                    },
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Icon(Utils.getRandomIconData());
                  }),
            ],
          ),
        ),
      )
    ]);
  }
}
