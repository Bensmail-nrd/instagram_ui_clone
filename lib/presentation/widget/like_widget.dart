import 'package:flutter/material.dart';

import '../../res.dart';

class LikeWidget extends StatefulWidget {
  LikeWidget({Key? key}) : super(key: key);

  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(Res.cur_1, width: 22);
  }
}
