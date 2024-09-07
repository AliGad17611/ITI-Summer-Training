import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.price,
    required this.image,
  });

  final String name;
  final String message;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10, end: 5, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 40,
                onBackgroundImageError: (error, stackTrace) {
                  print("Image load error: $error");
                },
              ),
              const Padding(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
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
                  '\$$price',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
