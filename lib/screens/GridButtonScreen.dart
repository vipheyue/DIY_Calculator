import 'package:diy_calculator/utils/AppColors.dart';
import 'package:flutter/material.dart';

import '../models/ButtonState.dart';
import '../utils/button_state_utils.dart';
import '../widgets/ImageButtonWithText.dart' show ImageButtonWithText;
import '../widgets/CuteCircleButton.dart'; // 导入工具类

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
              child: Material(
                color: Colors.pink[50], // 背景色
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10), // 关键：设置底部边距为10
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        width: 100,
                        margin: EdgeInsets.only(right: 8),
                        // decoration: BoxDecoration(
                        //   color: Colors.pink[50],
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '显示内容',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // ✅ 2. 文本显示框，靠右显示
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              // margin: EdgeInsets.only(right: 8),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              color: Colors.pink[50], // 背景色
              // color: Color(0xFFFCECE6 ), // 背景色
              child: GridView.builder(
                padding: EdgeInsets.zero,
                // 关键：清除默认内边距
                shrinkWrap: true,
                // 确保 GridView 只占用其内容所需的高度
                physics: NeverScrollableScrollPhysics(),
                // 如果不希望 GridView 内部滚动，可以添加这个
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 1.0,
                  // 你可以根据按钮的实际大小调整这个比例
                  mainAxisExtent: 96,
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

    return Material(
      color: Colors.transparent,
      // color: Colors.pink,
      child: InkWell(
        borderRadius: BorderRadius.circular(1.0),
        onTap: () => _onButtonPressed(state, index),
        child: _buildViewContent(state),
      ),
    );
  }

  Widget _buildViewContent(ButtonState state) {
    switch (state.buttonType) {
      case ButtonType.one:
      case ButtonType.two:
      case ButtonType.three:
      case ButtonType.add:

      case ButtonType.four:
      case ButtonType.five:
      case ButtonType.six:
      case ButtonType.subtract:

      case ButtonType.seven:
      case ButtonType.eight:
      case ButtonType.nine:
      case ButtonType.multiply:

      case ButtonType.more:
      case ButtonType.zero:
      case ButtonType.dot:
      case ButtonType.calculate:

        return CuteCircleButton(
          text: state.text,
          backgroundColor:AppColors.buttonBackgroundColor,
          textColor: AppColors.buttonTextColor,
        );
      default:
        // return Stack(child: Image.asset(state.backgroundImage!));
        return ImageButtonWithText(
          backgroundImage: state.backgroundImage!,
          text: state.text,
          borderColor: AppColors.borderColor,
          textColor: AppColors.buttonTextColor,
        );
    }
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
