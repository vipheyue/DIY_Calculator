import 'package:flutter/material.dart';

import '../models/ButtonState.dart';

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
        text: '${index + 1}',
        backgroundColor:  Colors.blue,
        buttonType: ButtonType.zero,
      );
    });
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
          color: Colors.amber,
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
          onTap:  () => _onButtonPressed(state, index),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/shengdanliwu.png'),
              ),
              // 显示数字
              Positioned(
                bottom: 1,
                right: 1,
                child: Text(
                  '${state.text}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
