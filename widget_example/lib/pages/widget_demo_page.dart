import 'package:flutter/material.dart';
import '../demos/text_demo.dart';
import '../demos/button_demo.dart';
import '../demos/container_demo.dart';
import '../demos/list_demo.dart';
import '../demos/column_demo.dart';
import '../demos/row_demo.dart';
import '../demos/stack_demo.dart';

class WidgetDemoPage extends StatefulWidget {
  const WidgetDemoPage({super.key});

  @override
  State<WidgetDemoPage> createState() => _WidgetDemoPageState();
}

class _WidgetDemoPageState extends State<WidgetDemoPage> {
  // 记录当前选中的演示项下标，初始值为0默认显示第一个演示
  int _currentSelectedDemoIndex = 0;

  // 所有演示项的标题数组，方便批量生成按钮
  final List<String> _demoTitles = [
    '文本演示',
    '按钮演示',
    '容器演示',
    '列表演示',
    '垂直布局',
    '水平布局',
    '堆叠布局',
  ];

  // 弹出底部提示消息的辅助方法，使用SnackBar组件
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // 根据选中的索引返回对应的演示Widget，实现动态切换
  Widget _getCurrentDemo() {
    switch (_currentSelectedDemoIndex) {
      case 0:
        return const TextDemo();
      case 1:
        return ButtonDemo(showMessage: _showMessage);
      case 2:
        return ContainerDemo(showMessage: _showMessage);
      case 3:
        return ListDemo(showMessage: _showMessage);
      case 4:
        return const ColumnDemo();
      case 5:
        return const RowDemo();
      case 6:
        return const StackDemo();
      default:
        return const TextDemo();
    }
  }

  // 核心build方法：Flutter框架自动调用这个方法来构建和渲染界面
  @override
  Widget build(BuildContext context) {
    // context是构建上下文对象，保存了应用树信息，很多Flutter API需要它
    // Scaffold是Material Design的标准页面骨架，预置AppBar等常用页面元素
    return Scaffold(
      // appBar属性：设置页面顶部的导航栏
      appBar: AppBar(
        // 导航栏的标题文字，const表示是编译时常量，性能更好
        title: const Text('Flutter Widget 示例'),
      ),
      // body属性：页面主体内容区域，AppBar以下的所有空间都归它管
      body: Column(
        // children是垂直布局的子组件数组，子组件从上到下依次排列
        children: [
          // 第一个子组件：用Container包裹所有演示切换按钮
          Container(
            // padding设置容器内边距，上下左右各留16像素空白，避免按钮贴边
            padding: const EdgeInsets.all(16),
            // Wrap自动换行布局：按钮太多一行放不下时，自动放到下一行
            child: Wrap(
              // spacing：水平方向，两个相邻按钮之间的间距为8像素
              spacing: 8,
              // runSpacing：垂直方向，两行按钮之间的行间距为8像素
              runSpacing: 8,
              // List.generate动态生成所有按钮，数量和演示标题数组长度一致
              children: List.generate(_demoTitles.length, (demoItemIndex) {
                // 每循环一次返回一个ElevatedButton高级按钮
                return ElevatedButton(
                  // 按钮点击事件回调：用户点击按钮时执行里面的代码
                  onPressed: () {
                    // setState通知Flutter框架：状态数据变化了，请重新构建UI
                    setState(() {
                      // 更新选中下标，现在程序记住用户想看第几个演示
                      _currentSelectedDemoIndex = demoItemIndex;
                    });
                    // 弹出底部提示，告知用户切换到了哪个演示，使用$做字符串插值
                    _showMessage('已切换到：${_demoTitles[demoItemIndex]}');
                  },
                  // 自定义按钮的样式
                  style: ElevatedButton.styleFrom(
                    // 三元运算符：选中的按钮背景变蓝色，其他按钮用默认颜色
                    backgroundColor: _currentSelectedDemoIndex == demoItemIndex ? Colors.blue : null,
                    // 选中的按钮文字变白色，其他按钮文字用默认颜色
                    foregroundColor: _currentSelectedDemoIndex == demoItemIndex ? Colors.white : null,
                  ),
                  // 按钮上显示的文字，从演示标题数组中取出
                  child: Text(_demoTitles[demoItemIndex]),
                );
              }),
            ),
          ),
          // 第二个子组件：水平分割线，分隔按钮区和演示内容区
          const Divider(),
          // 第三个子组件：Expanded占满Column剩下的所有空白空间
          // 没有Expanded的话，ListView这类滚动组件会因为没有确定高度报错
          Expanded(
            // Expanded内部的子组件用Center居中
            child: Center(
              // 调用_getCurrentDemo方法，根据_selectedIndex动态显示对应演示
              child: _getCurrentDemo(),
            ),
          ),
        ],
      ),
    );
  }
}
