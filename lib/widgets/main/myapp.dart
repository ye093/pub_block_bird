import 'package:flutter/material.dart';
// 主页面内容
import 'main_content.dart';

/// 程序入口
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // 页面，主题
    return MaterialApp(
      theme: ThemeData( // 配置全局主题
        primarySwatch: Colors.deepPurple,
      ),
      home: MainContent(title: '海阔天空',),
    );
  }

}