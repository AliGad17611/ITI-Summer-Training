// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:day10/models/product_model.dart';


Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  Products({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory Products.fromJson(json) => Products(
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
