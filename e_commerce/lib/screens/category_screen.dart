import 'package:e_commerce/constants.dart';
import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/screens/drawer_screen.dart';
import 'package:e_commerce/services/all_categories_service.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:e_commerce/widgets/custom_appbar.dart';
import 'package:e_commerce/widgets/grid_view_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [];
  List<ProductModel> _products = []; // Initialize the product list
  bool _isLoading = true;
  int categoriesIndex = 0;
  final ProductService _productService =
      ProductService(); // Instance of ProductService

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  // Fetch categories from the service
  Future<void> _fetchCategories() async {
    try {
      final fetchedCategories = await AllCategoriesService().getAllCategories();
      setState(() {
        categories.clear();
        categories.addAll(fetchedCategories);
        if (categories.isNotEmpty) {
          // Fetch products for the first category by default
          _fetchProducts(categories[0]);
        }
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  // Fetch products by category ID
  Future<void> _fetchProducts(String categoryId) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final productsModel =
          await _productService.getProductsByCategory(categoryId);
      final products = productsModel;

      final userId = await getUserId();
      if (userId == null) {
        throw Exception('User ID is null');
      }

      for (var product in products) {
        bool isFavorite = await _productService.isProductFavorite(
            userId, product.id.toString());
        product.isFavorite = isFavorite;
      }

      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching products: $e');
    }
  }

  // Toggle favorite status
  void _toggleFavorite(ProductModel product) async {
    final userId = await getUserId();
    if (userId == null) {
      // Handle case where user ID is null
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
          child: CustomAppBar(title: 'Categories'),
        ),
        drawer: const DrawerScreen(),
        body: Column(
          children: [
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 16, bottom: 16),
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          categoriesIndex = index;
                        });
                        _fetchProducts(categories[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: index == categoriesIndex
                              ? kPrimaryColor
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: index == categoriesIndex
                                  ? Colors.white
                                  : kDefaultColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              3 / 4, // Adjust the aspect ratio as needed
                        ),
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = _products[index];
                          return GridViewItem(
                            product: product,
                            onFavoritePressed: () => _toggleFavorite(product),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
