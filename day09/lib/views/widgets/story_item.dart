import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key,required this.name,});
  final String name ;


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 70,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
         const Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/m1.jpg"),
              radius: 35,
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
        const SizedBox(height: 5),
        Text(name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              height: 1,
              color: Colors.black,
              fontSize: 18,
            ))
      ]));
  }
}