import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/controllers/products_controller.dart';

class ListProductsScreen extends StatelessWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.put(ProductsController());
    productsController.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text('brand'.tr),
      ),
      body: SafeArea(
        child: GetBuilder<ProductsController>(
          builder: (_dx) {
            print("algo aconteceu");
            return ListView.builder(
              itemCount: _dx.products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(_dx.products[index].name),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
