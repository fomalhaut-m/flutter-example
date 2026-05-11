import 'package:flutter/material.dart';
import 'pages/widget_demo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget 示例',
      home: const WidgetDemoPage(),
    );
  }
}
