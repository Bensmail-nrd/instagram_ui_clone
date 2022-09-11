import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/widget/like_widget.dart';

import '../../res.dart';
import 'user_icon.dart';

class Post extends StatelessWidget {
  const Post({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserIcon(),
                  const SizedBox(width: 8),
                  const Text("User Name")
                ],
              ),
              const Icon(Icons.more_vert)
            ],
          ),
        ),
        Image.asset(Res.concert),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LikeWidget(),
                    Image.asset(Res.bulle, width: 22),
                    Image.asset(Res.send, width: 22),
                  ],
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Res.save, width: 22),
                    ],
                  )),
            ],
          ),
        ),
        Row(
          children: const [
            SizedBox(width: 12),
            Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 12),
            Text("This is a comment")
          ],
        )
      ],
    );
  }
}
