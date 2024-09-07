import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {super.key,
      required this.name,
      required this.message,
      required this.time});
  final String name;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10, end: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/m1.jpg"),
              radius: 40,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: 5,
                bottom: 5,
              ),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
            height: 90,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.circle,
                    color: Colors.blue,
                    size: 15,
                  ),
                ],
              ),
              SizedBox(
                width: 210,
                child: Text(
                  message,
                  softWrap: true,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )
            ]),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(
                time,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
