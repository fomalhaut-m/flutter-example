import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  final void Function(String) showMessage;

  const ContainerDemo({super.key, required this.showMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.blueGrey, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text('Hello APP!', style: TextStyle(color: Colors.green)),
          IconButton(
            icon: Icon(Icons.phone_android),
            onPressed: () {
              showMessage('点击了容器内的图标按钮');
            },
          ),
        ],
      ),
    );
  }
}
