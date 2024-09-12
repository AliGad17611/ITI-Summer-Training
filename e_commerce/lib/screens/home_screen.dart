import 'package:e_commerce/helper/get_user_information.dart';
import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:e_commerce/screens/drawer_screen.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/grid_view_item.dart';
import 'package:e_commerce/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> _products = [];
  bool _isLoading = true;
  String _userName = 'User'; // Default value
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final productsModel = await _productService.getAllProducts();
      final products = productsModel.products ?? [];

      final userId = await getUserId();
      if (userId == null) {
        throw Exception('User ID is null');
      }

      for (var product in products) {
        bool isFavorite = await _productService.isProductFavorite(
            userId, product.id.toString());
        product.isFavorite = isFavorite;
      }

      final userName = await getUserName(userId);
      setState(() {
        _products = products;
        _userName = userName;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Optionally show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching products')),
      );
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
      _productService.addProductToFavorites(userId, product.id.toString());
    } else {
      _productService.removeProductFromFavorites(userId, product.id.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: CustomAppBar(title: 'E-Commerce'),
        ),
        drawer: const DrawerScreen(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, ${_userName.split(' ').first}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Text(
                              'What are you looking for today?',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 4,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final product = _products[index];
                          return GridViewItem(
                            product: product,
                            onFavoritePressed: () => _toggleFavorite(product),
                          );
                        },
                        childCount: _products.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
