import 'dart:math';

import 'package:dev_azuma/widget_with_codeview_mod/widget_with_codeview.dart';
import 'package:flutter/material.dart';

import 'package:dev_azuma/template_lite.dart';

void main() {
  runApp(MyApp());
}

/// ! Ensure the files in [filePath] are included in pubspec.yaml
/// In this example the codeViewer will display this file's code
/// by pointing to the main.dart file
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: WidgetWithCodeView(
            headerWidget: const Text('Test'),
            filePath: 'lib/template_lite.dart',
          
            /// [codeLinkPrefix] is optional. When it's specified, two more buttons
            /// (open-code-in-browser, copy-code-link) will be added in the code view.
            codeLinkPrefix:
                'https://github.com/azmanbarraquias/dev_azuma_flutter_project_reviewer/blob/master/lib/main.dart',
            labelBackgroundColor: Theme.of(context).canvasColor,
            labelTextStyle:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
            showLabelText: true,
            child: const MyPage(),
          ),
        ),
      ),
    );
  }
}
