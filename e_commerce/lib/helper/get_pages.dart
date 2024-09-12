import 'package:e_commerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

List<PageViewModel> getPages(BuildContext context) {
  return [
    PageViewModel(
      title: "Welcome to Our Store",
      body: "Browse a wide variety of products at the best prices.",
      image: Image.asset("assets/images/splash1.png", height: 250.0),
      decoration: getDecoration(),
    ),
    PageViewModel(
      title: "Best Products",
      body: "We have a wide range of products for you to choose from.",
      image: Image.asset("assets/images/splash2.png", height: 250.0),
      decoration: getDecoration(),
    ),
    PageViewModel(
      title: "Fast Delivery",
      body: "Get your products delivered quickly and efficiently.",
      image: Image.asset("assets/images/splash3.png", height: 250.0),
      footer: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CustomButton(
          title: "Get Started",
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
      decoration: getDecoration(),
    ),
  ];
}

PageDecoration getDecoration() {
  return const PageDecoration(
    pageColor: Colors.white,
    pageMargin: EdgeInsets.only(top: 50),
    titleTextStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20.0),
  );
}
