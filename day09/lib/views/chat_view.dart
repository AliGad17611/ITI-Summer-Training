import 'package:day09/models/products_model.dart';
import 'package:day09/services/api_provider.dart';
import 'package:day09/views/widgets/chat_item.dart';
import 'package:day09/views/widgets/story_item.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  Products? productsModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProductsfromApi();
  }

  getProductsfromApi() async {
      productsModel = await ApiProvider().getProducts();
      setState(() {
        isLoading = false;
      });
    try {
    } catch (e) {
      print("Error fetching products: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : productsModel == null || productsModel!.products == null
              ? const Center(child: Text("No products found."))
              : SingleChildScrollView(
                  child: Column(
                    children: [
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
                                Icon(Icons.search,
                                    color: Colors.grey[800], size: 30),
                                const SizedBox(width: 10),
                                Text("Search",
                                    style: TextStyle(
                                        color: Colors.grey[800], fontSize: 20)),
                              ],
                            ),
                          )),
                      const SizedBox(height: 15),
                      Container(
                        height: 120,
                        margin: const EdgeInsetsDirectional.only(
                            start: 10, end: 10),
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => const StoryItem(
                                  name: "Ahmed",
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 15),
                            itemCount: 7),
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, item) => ChatItem(
                                name: productsModel!.products![item].title!,
                                message:
                                    productsModel!.products![item].description!,
                                price: productsModel!.products![item].price
                                    .toString(),
                                image:
                                    productsModel!.products![item].thumbnail!,
                              ),
                          separatorBuilder: (context, item) =>
                              const SizedBox(height: 5),
                          itemCount: productsModel!.products!.length),
                    ],
                  ),
                ),
    );
  }
}
