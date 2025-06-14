import 'package:flutter/material.dart';

// 按钮状态类
class ButtonState {
  final String text;
  final String? backgroundImage;
  final Color backgroundColor;
  final ButtonType buttonType;

  ButtonState({
    required this.text,
    this.backgroundImage,
    required this.backgroundColor,
    required this.buttonType,
  });
}
// 按钮类型枚举
enum ButtonType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  dot,

  more,


  add,
  subtract,
  multiply,
  divide,
  calculate,

  clean,
  delete,
  wait1,
  wait2,

}

