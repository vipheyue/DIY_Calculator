import 'package:flutter/material.dart';

import '../models/ButtonState.dart' ;

class CalculatorViewModel extends ChangeNotifier {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;

  void input(ButtonState button) {

    switch (button.buttonType) {
    // 🔢 数字与小数点
      case ButtonType.zero:
      case ButtonType.one:
      case ButtonType.two:
      case ButtonType.three:
      case ButtonType.four:
      case ButtonType.five:
      case ButtonType.six:
      case ButtonType.seven:
      case ButtonType.eight:
      case ButtonType.nine:
      case ButtonType.dot:

    // ➕➖✖️➗ 运算符
      case ButtonType.add:
      case ButtonType.subtract:
      case ButtonType.multiply:
      case ButtonType.divide:
    // 🧮 括号
      case ButtonType.leftParentheses:
      case ButtonType.rightParentheses:
      _expression += button.text;
      break;

    // 🟰 计算
      case ButtonType.calculate:
        // handleCalculate();
        break;




    // ⬅️ 删除
      case ButtonType.delete:
      clear();
        break;

    // ⏳ 等待中
      case ButtonType.wait2:
        // handleWait();
        break;

    // ⋯ 更多按钮
      case ButtonType.more:
        // handleMoreOptions();
        break;
      // default:
    }
    notifyListeners();
  }

  void clear() {
    // _expression = '';
    // _result = '';
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
    notifyListeners();
  }

  void _calculate() {
    // try {
    //   Parser parser = Parser();
    //   Expression exp = parser.parse(_expression.replaceAll('×', '*').replaceAll('÷', '/'));
    //   ContextModel cm = ContextModel();
    //   double eval = exp.evaluate(EvaluationType.REAL, cm);
    //   _result = eval.toString();
    // } catch (e) {
    //   _result = '错误';
    // }
  }
}