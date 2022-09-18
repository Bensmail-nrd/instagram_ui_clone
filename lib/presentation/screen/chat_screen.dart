import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/res.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  List chat = [
    'Hello',
    'How are you',
    'fine and you',
    'whats your name',
    'my name is noureddine',
    'and you',
    'mind your business',
    'what ?? why',
    'i"m sorry just kidding',
    'what"s about studying',
    'nothing new',
    'well, ok',
    'mind your business',
    'what ?? why',
    'i"m sorry just kidding',
    'what"s about studying',
    'nothing new',
    'mind your business',
    'what ?? why',
    'i"m sorry just kidding',
    'what"s about studying',
    'nothing new',
    'well, ok',
    'mind your business',
    'what ?? why',
    'i"m sorry just kidding',
    'what"s about studying',
    'nothing new',
    'well, ok',
    'ah, how is your wife'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            CircleAvatar(backgroundImage: AssetImage(Res.a)),
            SizedBox(
              width: 12.0,
            ),
            Text("User")
          ],
        ),
        actions: [
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.phone),
                Icon(Icons.video_camera_back_sharp),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: index % 2 == 0
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: index % 2 == 0 ? Colors.grey : Colors.black12),
                      child: Text(chat[index % chat.length]),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      right: 5, left: 5, bottom: 5, top: 12),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black12),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Message ...',
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(Icons.keyboard_voice),
                          Icon(Icons.image),
                          Icon(Icons.emoji_emotions),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Your message has been sent")));
                  },
                  child: const Icon(
                    Icons.send,
                    size: 38,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
