import 'package:flutter/material.dart';

/// text组件功能大揭密
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.center,
        height: 300,
        width: 300,
        color: Colors.deepPurpleAccent,
        child: const Text(
          '明年今日明年今日明年今日明年今日明年今日明年今日明年今日明年今日明年今日！！！',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}

/// RichText 富文本
class MyRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text.rich(const TextSpan(
      text: '只要平凡',
      children: <TextSpan>[
        const TextSpan(
            text: '张杰',
            style: const TextStyle(
                color: Colors.red, fontStyle: FontStyle.italic)),
        const TextSpan(
            text: '张碧晨',
            style: const TextStyle(
                color: Colors.amber, fontWeight: FontWeight.bold))
      ],
    ));
  }
}

/// 为Text添加点击事件
class ClickableText extends StatelessWidget {
  ClickableText({@required this.onPress, Key key}) : super(key: key);

  //从外面传进来的点击事件
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress, child: const Text('按钮文字'));
  }
}

/// 用InkWell代替GestureDetector
class TextInkWell extends StatelessWidget {
  TextInkWell({@required this.onPress, Key key}) : super(key: key);

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurpleAccent,
      child: InkWell(
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: const Text(
              '用InkWell来代替GestureDetector',
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}

/// InkWell加动画
class AnimatedTextInkWell extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedTextInkWellState();
  }

}

class _AnimatedTextInkWellState extends State<AnimatedTextInkWell> {

  // 50到100随意切换
  double _sideLength = 50;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _sideLength,
      width: _sideLength,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: Colors.yellow,
        child: InkWell(
          onTap: () {
            setState(() {
              _sideLength == 50 ? _sideLength = 100 : _sideLength = 50;
            });
          },
        ),
      ),
    );
  }

}
