import 'package:flutter/material.dart';
import 'screens/GridButtonScreen.dart';

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