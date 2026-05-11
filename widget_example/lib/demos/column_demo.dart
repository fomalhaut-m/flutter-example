import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('垂直布局', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Icon(Icons.line_axis, size: 40),
        const Divider(height: 30),
        Text('名称：Flutter Widget 示例'),
        Text('作者：Luke'),
        Text('版本：1.0.0'),
        Text('描述：这是一个 Flutter 应用示例'),
        const Divider(height: 30),
      ],
    );
  }
}
