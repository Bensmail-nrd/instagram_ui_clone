import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/widget/chat_list_tile.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemBuilder: (context, index) => ChatListTile(),
          itemCount: 15,
          shrinkWrap: true),
    );
  }
}
