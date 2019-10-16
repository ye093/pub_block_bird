import 'package:flutter/material.dart';

import '../buttons/fancy_button.dart';

/// 主页面
class MainContent extends StatefulWidget {
  // 定义标题
  final String title;

  MainContent({Key key, this.title}) : super(key: key);

  @override
  _MainContentState createState() {
    return _MainContentState();
  }
}

/// 主页面状态管理，对外不可见
class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面
      appBar: AppBar(
        elevation: 0, // 阴影
        centerTitle: true, // 标题居中
        title: Text(widget.title), //标题
      ),
      body: Center(
        child: FancyButton(
          onPress: () {
            print('我点击了');
          },
          text: '我是叶金耘',
        ),
      ),
    );
  }
}
