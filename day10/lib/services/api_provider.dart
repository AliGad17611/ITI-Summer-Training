
import 'package:day10/models/products_model.dart';
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
  Future<String> userLogin({required String userName, required String password}) async {
  try {
    FormData formData = FormData.fromMap({
      'username': userName,
      'password': password,
    });
    
    Response response = await Dio().post('https://dummyjson.com/auth/login', data: formData);
    print(response.data);
    print(response.data['token']);
    
    return 'Login Success';
  } on DioException catch (e) {
    print(e.response?.data);
    return e.response?.data['message'] ?? 'An error occurred';
  }
}
}
