import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: MyPage(),
      ),
    ),
  ));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(sections: [
        PieChartSectionData(
            value: 50, title: 'test', showTitle: true, color: Colors.pink),   PieChartSectionData(
            value: 50, title: 'test', showTitle: true, color: Colors.red),
      ]),
    );
  }
}
