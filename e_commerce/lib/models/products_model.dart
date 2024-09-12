// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce/models/product_model.dart';

ProductsModel productsFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
     List<ProductModel>? products;
    final int? total;
    final int? skip;
    final int? limit;

    ProductsModel({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        products: json["products"] == null ? [] : List<ProductModel>.from(json["products"]!.map((x) => ProductModel.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}
