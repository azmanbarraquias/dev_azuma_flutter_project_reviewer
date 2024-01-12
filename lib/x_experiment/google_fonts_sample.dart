import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Scaffold(body: LogoFade())));

class LogoFade extends StatefulWidget {
  const LogoFade({super.key});

  @override
  State<LogoFade> createState() => LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;
  double iconSize = 30;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      iconSize = opacityLevel == 0 ? 30 : 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            opacity: opacityLevel,
            curve: Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(seconds: 1),
            child: FlutterLogo(
              size: iconSize,
            ),
          ),
          ElevatedButton(
            onPressed: _changeOpacity,
            child: const Text('Fade Logo'),
          ),
        ],
      ),
    );
  }
}
