import 'package:flutter/material.dart';

class LikeWidget extends StatefulWidget {
  LikeWidget({Key? key}) : super(key: key);

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> animation;
  int state = 0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return IconButton(
            onPressed: () {
              if (state == 0) {
                animationController.forward();
                state = 1;
              } else {
                animationController.reverse();
                state = 0;
              }
            },
            icon: Icon(
              Icons.favorite,
              color: animation.value,
            ));
      },
    );
  }
}
