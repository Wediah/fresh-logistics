import 'package:flutter/material.dart';
import 'package:freshlogistics/common/widgets/appbar/appbar.dart';
import 'package:freshlogistics/common/widgets/layouts/grid_layout.dart';
import 'package:freshlogistics/common/widgets/products/cart/product_card_vertical.dart';
import 'package:freshlogistics/common/widgets/texts/section_heading.dart';
import 'package:freshlogistics/features/shop/controllers/product_controller.dart';
import 'package:freshlogistics/features/shop/models/product_model.dart';
import 'package:freshlogistics/utils/constants/sizes.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final productController = Get.find<ProductController>();
  List<Product> searchResults = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    print('🔍 SearchScreen initialized');
    // Initialize with empty search results, they'll be populated when user searches
    searchResults = [];
  }

  void _performSearch(String query) async {
    print('🔍 Performing search for: "$query"');
    setState(() {
      isSearching = true;
    });

    try {
      final results = await productController.searchProducts(query);
      print('🔍 Search results: ${results.length} products found');
      setState(() {
        searchResults = results;
        isSearching = false;
      });
    } catch (e) {
      print('🔍 Search error: $e');
      setState(() {
        searchResults = [];
        isSearching = false;
      });
      // Optionally show a snackbar with error
      Get.snackbar('Error', 'Failed to search products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FAppBar(
        title: Text('Search Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: _performSearch,
                decoration: InputDecoration(
                  hintText: 'Search for products, brands, categories...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _performSearch('');
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwSections),

              // Results section
              if (isSearching)
                const Center(child: CircularProgressIndicator())
              else ...[
                if (_searchController.text.isNotEmpty) ...[
                  SectionHeading(
                    title: 'Search Results (${searchResults.length})',
                    showActionButton: false,
                  ),
                  const SizedBox(height: Sizes.spaceBtwItems),
                ],

                // Products Grid
                if (_searchController.text.isEmpty)
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Icon(
                          Icons.search,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Search for products, brands, and categories',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start typing to find what you\'re looking for',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                else if (searchResults.isEmpty)
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found for "${_searchController.text}"',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try searching with different keywords',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  GridLayout(
                    itemCount: searchResults.length,
                    itemBuilder: (_, index) => ProductCardVertical(
                      product: searchResults[index],
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
