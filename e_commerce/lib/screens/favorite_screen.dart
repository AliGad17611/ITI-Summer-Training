import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/drawer_screen.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/grid_view_item.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<ProductModel> favoriteProducts = [];
  List<String> favoriteProductIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteProducts();
  }

  Future<void> _loadFavoriteProducts() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userId = await getUserId();
      if (userId == null) {
        throw Exception('User ID is null');
      }

      // Fetch favorite product IDs
      favoriteProductIds = await ProductService().getUserFavorites(userId);

      // Fetch product details based on the IDs
      final products = await Future.wait(
          favoriteProductIds.map((id) => ProductService().getProductById(id)));

      // Ensure we check if each product is still marked as a favorite
      for (var product in products) {
        bool isFavorite = await ProductService()
                .isProductFavorite(userId, product!.id.toString())
            ? true
            : false;
        product.isFavorite = isFavorite;
      }

      setState(() {
        favoriteProducts = products.whereType<ProductModel>().toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading favorite products: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _toggleFavorite(ProductModel product) async {
    final userId = await getUserId();
    if (userId == null) {
      return;
    }

    setState(() {
      product.isFavorite = !product.isFavorite;
    });

    if (product.isFavorite) {
      ProductService().addProductToFavorites(userId, product.id.toString());
    } else {
      ProductService()
          .removeProductFromFavorites(userId, product.id.toString());
      setState(() {
        favoriteProducts.remove(product); // Remove from UI after unfavorite
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CustomAppBar(title: 'Favorite Products'),
        ),
        drawer: const DrawerScreen(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : favoriteProducts.isEmpty
                  ? const Center(child: Text('No favorite products found.'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4, // Adjust as needed
                      ),
                      itemCount: favoriteProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = favoriteProducts[index];
                        return GridViewItem(
                          product: product,
                          onFavoritePressed: () => _toggleFavorite(product),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
