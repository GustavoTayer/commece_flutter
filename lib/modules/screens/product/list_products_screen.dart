import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wp_commerce_1/components/atoms/search_icon_button.dart';
import 'package:wp_commerce_1/modules/controllers/products_controller.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';

class ListProductsScreen extends StatelessWidget {
  const ListProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsController productsController = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('brand'.tr),
        actions: const [
          SearchIconButton()
        ],
      ),
      body: SafeArea(
        child: GetBuilder<ProductsController>(
          builder: (dx) {
            if(dx.loading.isTrue) {
              return const Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }
            return GridView.count(
                crossAxisCount: 2,
                children: List.generate(dx.products.length, (index) {
                  Product product = dx.products[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Column(
                        children: [
                          Image.network(
                            product.images[0].src,
                            height: 120,
                          ),
                          Text(product.name),
                          Text(product.price.toString())
                        ],
                      )),
                    ),
                  );
                }));
          },
        ),
      ),
    );
  }
}
