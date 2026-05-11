import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello APP!',
      style: TextStyle(
        fontSize: 20,
        color: Colors.green,
      ),
    );
  }
}
