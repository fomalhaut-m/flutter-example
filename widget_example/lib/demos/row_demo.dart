import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('水平布局', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Icon(Icons.line_axis, size: 30),
        Text('Flutter'),
        Text('示例'),
      ],
    );
  }
}
