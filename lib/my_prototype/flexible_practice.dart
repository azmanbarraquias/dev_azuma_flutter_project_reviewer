import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("Flutter Demo"),
    ),
    body: const MyFlexible(),
  )));
}

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
                child: const Text(
                  'Item 1 - pretty bigxxsdasdasdasdasddsdssds!',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              height: 100,
              child: Text('Item 2'),
              color: Colors.blue,
            ),
            Container(
              height: 100,
              child: Text('Item 33'),
              color: Colors.orange,
            ),
            // Container
            Container()
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              child: Text('Item 1 - pretty big!'),
              color: Colors.red,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                child: Text('Item 2'),
                color: Colors.blue,
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                child: Text('Item 3'),
                color: Colors.grey,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                child: Text('Item 4'),
                color: Colors.orange,
              ),
            ),
            // Container
            Container()
          ],
        ),
      ],
    );
  }
}
