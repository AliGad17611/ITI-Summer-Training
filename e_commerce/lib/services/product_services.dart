import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/products_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Dio _dio = Dio();

  // Fetch all products from the external API
  Future<ProductsModel> getAllProducts() async {
    try {
      Response response = await _dio.get('https://dummyjson.com/products');
      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      log('Fetched product: ${productsModel.products![0].id.toString()}');
      return productsModel;
    } catch (e) {
      log('Error fetching products: $e');
      rethrow;
    }
  }

  // Fetch a specific product by its ID from the external API
  Future<ProductModel?> getProductById(String productId) async {
    try {
      Response response = await _dio.get('https://dummyjson.com/products/$productId');
      ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    } catch (e) {
      log('Error fetching product by ID: $e');
      return null;
    }
  }
  Future <List<ProductModel>> getProductsByCategory(String category) async {
    try {
      Response response = await _dio.get('https://dummyjson.com/products/category/$category');
      List<ProductModel> products = (response.data['products'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      log('Error fetching products by category: $e');
      rethrow;
    }
  }

  // Add a product to the user's favorite list in Firestore
  Future<void> addProductToFavorites(String userId, String productId) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(userId);
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        // Update existing document
        await userDoc.update({
          'favoriteProducts': FieldValue.arrayUnion([productId])
        });
      } else {
        // Create new document with favoriteProducts initialized
        await userDoc.set({
          'favoriteProducts': [productId]
        });
      }

      log('Product $productId added to user $userId favorites.');
    } catch (e) {
      log('Error adding product to favorites: $e');
      rethrow;
    }
  }

  // Remove a product from the user's favorite list in Firestore
  Future<void> removeProductFromFavorites(String userId, String productId) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(userId);
      DocumentSnapshot userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        // Update existing document
        await userDoc.update({
          'favoriteProducts': FieldValue.arrayRemove([productId])
        });
      } else {
        log('User document not found. Cannot remove product from favorites.');
      }

      log('Product $productId removed from user $userId favorites.');
    } catch (e) {
      log('Error removing product from favorites: $e');
      rethrow;
    }
  }

  // Check if a product is in the user's favorite list
  Future<bool> isProductFavorite(String userId, String productId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        List<dynamic> favoriteProducts = userDoc['favoriteProducts'] ?? [];
        return favoriteProducts.contains(productId);
      } else {
        log('User document not found.');
        return false;
      }
    } catch (e) {
      log('Error checking if product is favorite: $e');
      return false;
    }
  }

  // Fetch user's favorite products from Firestore
  Future<List<String>> getUserFavorites(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        List<dynamic> favoriteProducts = userDoc['favoriteProducts'] ?? [];
        return favoriteProducts.cast<String>();
      } else {
        log('User document not found.');
        return [];
      }
    } catch (e) {
      log('Error fetching user favorites: $e');
      rethrow;
    }
  }

}
