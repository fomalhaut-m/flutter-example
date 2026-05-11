# Flutter Widget 演示项目

这是一个交互式的 Flutter 基础 Widget 学习演示项目，包含了常用的 Flutter 组件和布局示例，通过点击按钮就可以实时切换不同的演示内容。

## 项目特点

- 🎯 7个常用 Flutter Widget 演示
- 🔄 交互式切换演示内容，无需重启应用
- 💬 所有点击操作都有底部 SnackBar 弹窗提示
- 📝 代码包含详细的中文注释，适合 Flutter 初学者学习

## 包含的演示项

| 序号 | 演示名称 | 说明 |
|------|----------|------|
| 1 | 文本演示 | 展示 Text 组件的基本使用和样式设置 |
| 2 | 按钮演示 | 展示 IconButton 和 ElevatedButton 两种按钮的使用 |
| 3 | 容器演示 | 展示 Container 组件的颜色、边框、圆角、内外边距等装饰效果 |
| 4 | 列表演示 | 展示 ListView.builder 高性能列表组件的使用 |
| 5 | 垂直布局 | 展示 Column 垂直布局组件的对齐方式配置 |
| 6 | 水平布局 | 展示 Row 水平布局组件的对齐方式配置 |
| 7 | 堆叠布局 | 展示 Stack 堆叠布局组件的层叠效果 |

---

## 项目架构说明

### 整体结构

整个项目采用典型的 Flutter 有状态组件架构，核心分为三层：

```
├── MyApp (StatelessWidget)
│   └── WidgetDemoPage (StatefulWidget)
│       ├── _WidgetDemoPageState (State)
│       │   ├── 状态管理
│       │   ├── 事件处理
│       │   └── 各个演示构建方法
│       └── 演示内容区域
```

### 架构详解

#### 1. MyApp 根组件（无状态）
- 继承自 `StatelessWidget`，作为整个应用的入口框架
- 不维护任何状态，只负责配置 `MaterialApp`（Material Design 应用容器）
- 设置应用标题，指定首页为 `WidgetDemoPage`

#### 2. WidgetDemoPage 页面组件（有状态）
- 继承自 `StatefulWidget`，因为页面需要动态变化（切换演示内容）
- 重写 `createState()` 方法，创建关联的状态对象 `_WidgetDemoPageState`

#### 3. _WidgetDemoPageState 状态类
这是整个页面的核心大脑，负责：
- **状态数据维护**：保存 `_selectedIndex` 当前选中的演示项索引
- **事件处理**：所有按钮的点击、列表项的点击等交互逻辑
- **UI 构建**：`build()` 方法根据当前状态渲染页面
- **演示内容生产**：7个私有方法，分别构建不同的演示 Widget

---

## 演示内容切换的实现原理

### 核心思路
通过**索引状态 + 条件分发**的模式实现演示内容的动态切换，无需路由跳转，在同一个页面内完成内容更新。

### 切换流程详解

#### 第一步：定义选中状态变量
```dart
int _selectedIndex = 0;
```
在状态类中定义一个整数变量，用来记录当前选中的演示项的数组下标，初始值为0，默认显示第一个演示。

#### 第二步：演示标题数组
```dart
final List<String> _demoTitles = [
  '文本演示', '按钮演示', '容器演示', '列表演示', '垂直布局', '水平布局', '堆叠布局',
];
```
把所有演示的名称放到一个列表里，方便批量生成按钮，避免硬编码重复。

#### 第三步：批量生成切换按钮
使用 `List.generate()` 遍历标题数组，自动生成所有切换按钮：
```dart
children: List.generate(_demoTitles.length, (index) {
  return ElevatedButton(
    onPressed: () {
      // 点击按钮时更新选中状态
      setState(() {
        _selectedIndex = index;
      });
      // 弹出提示告知用户
      _showMessage('已切换到：${_demoTitles[index]}');
    },
    // 选中状态的按钮高亮显示
    style: ElevatedButton.styleFrom(
      backgroundColor: _selectedIndex == index ? Colors.blue : null,
      foregroundColor: _selectedIndex == index ? Colors.white : null,
    ),
    child: Text(_demoTitles[index]),
  );
}),
```

关键点：
- 每个按钮绑定自己对应的 `index` 索引
- 点击时调用 `setState()` 方法 —— 这是 Flutter 状态管理的核心
- `setState()` 会通知 Flutter 框架："我的数据变了，请重新构建界面！"
- 通过条件判断 `_selectedIndex == index` 实现选中按钮的高亮效果

#### 第四步：通过索引分发到对应的演示 Widget
创建一个 `_getCurrentDemo()` 方法，使用 `switch` 语句根据当前 `_selectedIndex` 返回对应的演示组件：
```dart
Widget _getCurrentDemo() {
  switch (_selectedIndex) {
    case 0: return _buildTextDemo();      // 文本演示
    case 1: return _buildButtonDemo();   // 按钮演示
    case 2: return _buildContainerDemo(); // 容器演示
    case 3: return _buildListDemo();      // 列表演示
    case 4: return _buildColumnDemo();   // 垂直布局演示
    case 5: return _buildRowDemo();      // 水平布局演示
    case 6: return _buildStackDemo();    // 堆叠布局演示
    default: return _buildTextDemo();
  }
}
```

#### 第五步：在页面中渲染当前演示
把 `_getCurrentDemo()` 返回的 Widget 放到页面的内容区域即可：
```dart
Expanded(
  child: Center(
    child: _getCurrentDemo(), // 这里就是动态切换的内容
  ),
)
```

---

## 关键技术点总结

1. **StatefulWidget + setState()**：Flutter 实现动态UI的基础模式
2. **索引驱动**：用一个整数就能控制N种不同界面的切换，代码非常简洁
3. **职责分离**：每个演示内容由独立的方法构建，代码解耦，方便后续扩展新演示
4. **SnackBar 反馈**：使用 ScaffoldMessenger 显示底部提示，提升交互体验
5. **Wrap 自动布局**：演示按钮多时自动换行，适配不同屏幕宽度

---

## 运行项目

确保你已经配置好 Flutter 开发环境，然后执行：

```bash
cd widget_example
flutter run
```

选择你要运行的设备（Linux桌面、Android、Chrome浏览器等），就能启动应用体验所有演示了。
