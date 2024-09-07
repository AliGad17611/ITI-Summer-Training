import 'package:day06/chat_item.dart';
import 'package:day06/story_item.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/emam.png"),
                radius: 22,
              ),
              SizedBox(width: 15),
              Text("Chats",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.grey[600],
              child: IconButton(
                  icon: const Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.grey[600],
              child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: () {}),
            ),
            const SizedBox(width: 10),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.search, color: Colors.grey[800], size: 30),
                      const SizedBox(width: 10),
                      Text("Search",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 20)),
                    ],
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const StoryItem(
                        name: "Ahmed",
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 15,
                      ),
                  itemCount: 7),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, item) => const ChatItem(
                      name: "Ahmed",
                      message: 'hello Ali',
                      time: '05:00 pm',
                    ),
                separatorBuilder: (context, item) => const SizedBox(
                      height: 5,
                    ),
                itemCount: 15)
          ]),
        ));
  }
}
