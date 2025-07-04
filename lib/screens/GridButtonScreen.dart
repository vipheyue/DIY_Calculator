import 'package:flutter/material.dart';

import '../models/ButtonState.dart';
import '../utils/button_state_utils.dart'; // 导入工具类

class GridButtonScreen extends StatefulWidget {
  const GridButtonScreen({super.key});

  @override
  State<GridButtonScreen> createState() => _GridButtonScreenState();
}

class _GridButtonScreenState extends State<GridButtonScreen> {
  // 创建20个按钮的状态集合 (4x5 = 20个按钮)
  late List<ButtonState> buttonStates =
  ButtonStateUtils.createCalculatorButtonStates();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            // ✅ 1. 顶部滑动列表
            // 让顶部的 ListView 和中间的 Container 填充剩余空间
            Expanded(
              child:
                  ListView.builder(
                    padding: EdgeInsets.only(bottom: 10), // 关键：设置底部边距为10
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                            '显示内容',
                            style: TextStyle(fontSize: 20, color: Colors.black87),
                          )),
                        ),
                      );
                    },
                  ),
              ),
            // ✅ 2. 文本显示框，靠右显示
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '显示内容',
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                ),
              ),
            ),
            // 你可以根据需要添加 Spacer() 来确保这部分内容尽可能填充
            // Spacer(), // 如果希望顶部和中间部分尽可能地向上推

            // SizedBox(height: 2),

            // ✅ 3. 网格按钮布局 - 不再使用 Expanded，使其内容决定其高度，并靠底部
            SizedBox(
              child: GridView.builder(
                padding: EdgeInsets.zero, // 关键：清除默认内边距
                shrinkWrap: true, // 确保 GridView 只占用其内容所需的高度
                physics: NeverScrollableScrollPhysics(), // 如果不希望 GridView 内部滚动，可以添加这个
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 1.0, // 你可以根据按钮的实际大小调整这个比例
                  mainAxisExtent:96,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _buildGridButton(buttonStates[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridButton(ButtonState state, int index) {
    // return Text("data");

    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(1.0),
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
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
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(1.0),
          onTap: () => _onButtonPressed(state, index),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center, // 关键：设置居中对齐
                padding: EdgeInsets.all(2.0), // 添加内边距
                child: Image.asset(state.backgroundImage!),
              ),
              // 显示数字
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.pink, // 边框颜色
                      width: 1, // 边框宽度
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white, // 内部背景色
                    radius: 18,
                    child: Text(
                      '${state.text}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[100],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(ButtonState state, int index) {
    // 显示点击反馈
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('点击了${state.text} '),
        duration: Duration(milliseconds: 800),
      ),
    );
  }
}
