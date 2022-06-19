import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/service/impl/product_service_impl.dart';
import 'package:wp_commerce_1/modules/domain/service/product_service.dart';

class ProductsController extends GetxController {

  ProductService productService = Get.put(ProductServiceImpl());
  var products = <Product>[].obs;

  Future<void> getProducts() async {
    var productsResponse = await productService.getProducts();
    products = productsResponse.obs;
    update();
  }
}