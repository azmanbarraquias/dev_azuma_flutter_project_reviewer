import 'package:dev_azuma/x_experiment/flutter_lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/flutter_all_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyPage(),
      theme: ThemeData(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Map<String, IconData> _foundUsers = {};

  @override
  initState() {
    _foundUsers = icons_data;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    Map<String, IconData> result = {};
    result.clear();
    if (enteredKeyword.isEmpty) {
      result = icons_data;
    } else {
      icons_data.forEach((key, currentVal) {
        if (key.contains(enteredKeyword.toLowerCase())) {
          result.putIfAbsent(key, () => currentVal);
        }
      });
    }
    _foundUsers = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _runFilter(value);
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: _foundUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentIcon = _foundUsers.entries.elementAt(index);
                      return Tooltip(
                        waitDuration: Durations.extralong4,
                        triggerMode: TooltipTriggerMode.tap,
                        onTriggered: () async {
                          xPrint('$currentIcon');
                          await Clipboard.setData(
                              ClipboardData(text: 'Icons.${currentIcon.key}'));
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Icons.${icons_data.entries.elementAt(index).key}, has been copy')));
                        },
                        message: currentIcon.key ?? '',
                        child: Card(
                          child: xIcon(
                            icon: Icon(
                              currentIcon.value,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: icons_data.length,
      itemBuilder: (context, index) {
        var item = icons_data.entries.elementAt(index);
        return Row(children: [Text("${item.key} - "), Icon(item.value)]);
      },
    );
  }
}

// you can use width and height for icon instead of size
xIcon({width = 30.00, height = 30.00, background, decoration, required icon}) {
  return Container(
    decoration: decoration,
    color: background,
    height: height,
    width: width,
    child: FittedBox(
      fit: BoxFit.fill,
      child: icon,
    ),
  );
}
