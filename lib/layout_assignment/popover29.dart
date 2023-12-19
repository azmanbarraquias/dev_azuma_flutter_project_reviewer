import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

void main() => runApp(PopoverExample());

class PopoverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Popover Example')),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(),
                    Button(),
                    Button(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(),
                    Button(),
                    Button(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Button(),
                    Button(),
                    Button(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: GestureDetector(
        child: const Center(child: Text('Click Me')),
        onTap: () {
          showPopover(
            context: context,
            bodyBuilder: (context) {
              return ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                children: const [
                  SizedBox(
                    height: 46,
                    child: Center(child: Text('群组简介')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  SizedBox(
                    height: 46,
                    child: Center(child: Text('中奖公告')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  SizedBox(
                    height: 46,
                    child: Center(child: Text('开奖结果')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  SizedBox(
                    height: 46,
                    child: Center(child: Text('管理员信息')),
                  ),
                ],
              );
            },
            onPop: () => print('Popover was popped!'),
            direction: PopoverDirection.top,
            backgroundColor: Colors.white,
            width: 120,
            arrowHeight: 15,
            arrowWidth: 30,
          );
        },
      ),
    );
  }
}
