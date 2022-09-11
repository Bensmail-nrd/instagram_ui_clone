import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/res.dart';

class UserIcon extends StatelessWidget {
  final int type;
  late int width;
  UserIcon({Key? key, this.type = 1}) {
    switch (type) {
      case 0:
        width = 30;
        break;
      case 1:
        width = 20;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width + 4),
          gradient: const LinearGradient(colors: [
            Colors.orangeAccent,
            Colors.redAccent,
            Colors.orange,
            Colors.deepOrangeAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(width + 2)),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width.toDouble())),
          child: Image.asset(Res.a,
              width: 2 * width.toDouble(),
              height: 2 * width.toDouble(),
              cacheWidth: 200,
              cacheHeight: 300,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
