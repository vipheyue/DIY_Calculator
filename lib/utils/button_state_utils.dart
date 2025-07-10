import 'package:flutter/material.dart' show Colors;

import '../models/ButtonState.dart';

class ButtonStateUtils {
  // 私有构造函数，防止实例化
  ButtonStateUtils._();

  // 创建计算器按钮状态列表
  static List<ButtonState> createCalculatorButtonStates() {
    return [
      // 第一行按钮
      ButtonState(
        text: '删',
        backgroundColor: Colors.blue,
        backgroundImage: "assets/images/1.png",
        buttonType: ButtonType.delete,
      ),
      ButtonState(
        text: '(',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/2.png",
        buttonType: ButtonType.leftParentheses,
      ),
      ButtonState(
        text: ')',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/17.png",
        buttonType: ButtonType.rightParentheses,
      ),
      ButtonState(
        text: '/',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/24.png",
        buttonType: ButtonType.divide,
      ),

      // 第二行按钮
      ButtonState(
        text: '7',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/24.png",
        buttonType: ButtonType.seven,
      ),
      ButtonState(
        text: '8',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/19.png",
        buttonType: ButtonType.eight,
      ),
      ButtonState(
        text: '9',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/9.png",
        buttonType: ButtonType.nine,
      ),
      ButtonState(
        text: 'X',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/2.png",
        buttonType: ButtonType.multiply,
      ),

      // 第三行按钮
      ButtonState(
        text: '4',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/24.png",
        buttonType: ButtonType.four,
      ),
      ButtonState(
        text: '5',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/19.png",
        buttonType: ButtonType.five,
      ),
      ButtonState(
        text: '6',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/9.png",
        buttonType: ButtonType.six,
      ),
      ButtonState(
        text: '-',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/2.png",
        buttonType: ButtonType.subtract,
      ),

      // 第四行按钮
      ButtonState(
        text: '1',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/24.png",
        buttonType: ButtonType.one,
      ),
      ButtonState(
        text: '2',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/19.png",
        buttonType: ButtonType.two,
      ),
      ButtonState(
        text: '3',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/9.png",
        buttonType: ButtonType.three,
      ),
      ButtonState(
        text: '+',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/2.png",
        buttonType: ButtonType.add,
      ),

      // 第五行按钮
      ButtonState(
        text: 'M',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/24.png",
        buttonType: ButtonType.more,
      ),
      ButtonState(
        text: '0',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/19.png",
        buttonType: ButtonType.zero,
      ),
      ButtonState(
        text: '.',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/9.png",
        buttonType: ButtonType.dot,
      ),
      ButtonState(
        text: '=',
        backgroundColor: Colors.transparent,
        backgroundImage: "assets/images/2.png",
        buttonType: ButtonType.calculate,
      ),
    ];
  }
}
