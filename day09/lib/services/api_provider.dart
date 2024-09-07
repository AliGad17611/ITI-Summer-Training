import 'package:day09/models/products_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Future<Products> getProducts() async {
      Response response =
          await Dio().get('https://dummyjson.com/products', queryParameters: {
        'select': 'id,title,description,category,price,thumbnail',
      });
      Products productsmodel = Products.fromJson(response.data);
      print(productsmodel.products![0].title);
      return productsmodel;
    
  }
}
