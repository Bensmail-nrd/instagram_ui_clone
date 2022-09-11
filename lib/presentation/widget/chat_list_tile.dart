import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/presentation/screen/chat_screen.dart';
import 'package:instagram_ui_clone/presentation/widget/user_icon.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ChatScreen();
          },
        ));
      },
      leading: UserIcon(),
      title: Text("User Name"),
      subtitle: Text("Message"),
      trailing: CircleAvatar(
        radius: 6,
        backgroundColor: Colors.green,
      ),
    );
  }
}
