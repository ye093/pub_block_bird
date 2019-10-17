import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// AnimatedList 动画列表，增删改查
class MyAnimatedList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAnimatedListState();
  }
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  // 列表状态管理
  final _myListKey = GlobalKey<AnimatedListState>();
  final _data = <String>[];

  @override
  void initState() {
    super.initState();
    // 先生成三条
    _data.addAll(_generateData(3));
  }

  @override
  Widget build(BuildContext context) {
    // 动画列表优先用AnimatedList
    return AnimatedList(
      key: _myListKey,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) =>
              _myListItem(context, _data[index], animation, index),
      initialItemCount: _data.length,
    );
  }

  // 生成多项数据
  List<String> _generateData(int count) {
    return List.generate(count, (i) => _generateOneData());
  }

  // 生成一项数
  String _generateOneData() {
    return WordPair.random().asLowerCase;
  }

  // 每一项的视图
  Widget _myListItem(BuildContext context, String text,
      Animation<double> animation, int index) {
    return SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          title: Material(
            color: Colors.deepPurple,
            child: InkWell(
                highlightColor: Colors.amber,
                onLongPress: () {
                  _removeItem(index);
                },
                onDoubleTap: () {
                  _insertItem(_generateOneData(), index);
                },
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
        ));
  }

  // 插入一项
  void _insertItem(String text, int index) {
    // 在前面插入一项
    _data.insert(index, text);
    _myListKey.currentState.insertItem(index);
  }

  // 移除一项
  void _removeItem(int index) {
    _data.removeAt(index);
    _myListKey.currentState
        .removeItem(index, (context, animation) => Container(color: Colors.lime,));
  }
}
