import 'package:flutter/material.dart';


// 按钮状态类
class ButtonState {
  final String text;
  final String? backgroundImage;
  final Color backgroundColor;
  final ButtonType buttonType;
  final int number;

  ButtonState({
    required this.text,
    this.backgroundImage,
    required this.backgroundColor,
    required this.buttonType,
    required this.number,
  });
}

// 按钮类型枚举
enum ButtonType {
  normal,
  highlighted,
  disabled,
  special,
}

class GridButtonScreen extends StatefulWidget {
  const GridButtonScreen({super.key});

  @override
  State<GridButtonScreen> createState() =>  _GridButtonScreenState();

}

class _GridButtonScreenState extends State<GridButtonScreen> {
  // 创建20个按钮的状态集合 (4x5 = 20个按钮)
  late List<ButtonState> buttonStates;

  @override
  void initState() {
    super.initState();
    initializeButtonStates();
  }

  void initializeButtonStates() {
    buttonStates = List.generate(20, (index) {
      // 根据索引生成不同的状态
      return ButtonState(
        text: '按钮${index + 1}',
        backgroundColor: _getColorByIndex(index),
        buttonType: _getButtonTypeByIndex(index),
        number: index + 1,
      );
    });
  }

  Color _getColorByIndex(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  ButtonType _getButtonTypeByIndex(int index) {
    if (index % 4 == 0) return ButtonType.special;
    if (index % 3 == 0) return ButtonType.highlighted;
    if (index % 7 == 0) return ButtonType.disabled;
    return ButtonType.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网格按钮布局'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 横向4个按钮
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.0, // 正方形按钮
          ),
          itemCount: 20, // 总共20个按钮 (4x5)
          itemBuilder: (context, index) {
            return _buildGridButton(buttonStates[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildGridButton(ButtonState state, int index) {
    return Container(
      decoration: BoxDecoration(
        color: state.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: _getBorderColor(state.buttonType),
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: state.buttonType != ButtonType.disabled
              ? () => _onButtonPressed(state, index)
              : null,
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 显示数字
                Text(
                  '${state.number}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _getTextColor(state.buttonType),
                  ),
                ),
                SizedBox(height: 4),
                // 显示文本
                Text(
                  state.text,
                  style: TextStyle(
                    fontSize: 12,
                    color: _getTextColor(state.buttonType),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // 显示按钮类型图标
                SizedBox(height: 4),
                Icon(
                  _getIconByButtonType(state.buttonType),
                  size: 16,
                  color: _getTextColor(state.buttonType),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getBorderColor(ButtonType type) {
    switch (type) {
      case ButtonType.highlighted:
        return Colors.amber;
      case ButtonType.disabled:
        return Colors.grey;
      case ButtonType.special:
        return Colors.white;
      default:
        return Colors.transparent;
    }
  }

  Color _getTextColor(ButtonType type) {
    switch (type) {
      case ButtonType.disabled:
        return Colors.grey[600]!;
      default:
        return Colors.white;
    }
  }

  IconData _getIconByButtonType(ButtonType type) {
    switch (type) {
      case ButtonType.highlighted:
        return Icons.star;
      case ButtonType.disabled:
        return Icons.block;
      case ButtonType.special:
        return Icons.diamond;
      default:
        return Icons.touch_app;
    }
  }

  void _onButtonPressed(ButtonState state, int index) {
    setState(() {
      // 点击时改变按钮状态，例如切换颜色
      buttonStates[index] = ButtonState(
        text: state.text,
        backgroundColor: state.backgroundColor == Colors.blue
            ? Colors.green
            : Colors.blue,
        buttonType: state.buttonType,
        number: state.number,
      );
    });

    // 显示点击反馈
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('点击了${state.text} - 数字: ${state.number}'),
        duration: Duration(milliseconds: 800),
      ),
    );
  }
}

// 主应用入口
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 网格按钮',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GridButtonScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}