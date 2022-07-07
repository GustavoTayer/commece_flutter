import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/controllers/products_controller.dart';
import 'package:wp_commerce_1/modules/controllers/search_controller.dart';
import 'package:wp_commerce_1/modules/screens/client_bottom_menu.dart';

class Search extends SearchDelegate {
  final SearchController searchController = Get.put(SearchController());
  final ProductsController productsController = Get.find<ProductsController>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchController.changeQuery(query);
    productsController.changeLoading(true);
    productsController.getProducts(query);
    return Container();
  }

  @override
  void showResults(BuildContext context) {
    Get.offAll(ClientBottomMenu());
    super.showResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
