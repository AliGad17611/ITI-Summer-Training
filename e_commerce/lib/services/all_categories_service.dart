import 'package:dio/dio.dart';

class AllCategoriesService {
  final Dio _dio = Dio();

  Future<List<String>> getAllCategories() async {
    try {
      Response response =
          await _dio.get('https://dummyjson.com/products/category-list');
      List<String> categories = response.data.cast<String>();
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
