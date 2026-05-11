import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  final void Function(String) showMessage;

  const ListDemo({super.key, required this.showMessage});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.label),
          title: Text('列表项 $index'),
          onTap: () {
            showMessage('点击了列表项 $index');
          },
        );
      },
    );
  }
}
