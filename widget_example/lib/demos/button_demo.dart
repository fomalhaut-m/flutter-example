import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  final void Function(String) showMessage;

  const ButtonDemo({super.key, required this.showMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 50,
          color: Colors.blueAccent,
          onPressed: () {
            showMessage('点击了图标按钮');
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('高级按钮'),
          onPressed: () {
            showMessage('点击了高级按钮');
          },
        ),
      ],
    );
  }
}
