import 'package:flutter/material.dart';

/// 按钮
class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPress, @required this.text, Key key})
      : super(key: key);

  final VoidCallback onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: const StadiumBorder(),
        onPressed: onPress,
        splashColor: Colors.cyan,
        fillColor: Colors.deepPurpleAccent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const RotatedBox(
                quarterTurns: 2, child: const Icon(Icons.arrow_back, color: Colors.white,)),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
