import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {
  final String content;
  final Function handler;

  const AdaptiveButton(
      {super.key, required this.content, required this.handler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () => handler(),
            child: Text(
              content,
              textAlign: TextAlign.end,
            ),
          )
        : ElevatedButton(
            onPressed: () => handler(),
            child: Text(
              content,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
              ),
            ));
  }
}
