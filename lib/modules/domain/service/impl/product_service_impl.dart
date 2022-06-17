import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/providers/product_provider.dart';
import 'package:wp_commerce_1/modules/domain/service/product_service.dart';
import 'package:wp_commerce_1/modules/providers/product_provider_impl.dart';

class ProductServiceImpl extends ProductService {

  ProductProvider productProvider = Get.put(ProductProviderImpl());

  @override
  Future<List<Product>> getProducts() async {
    return await productProvider.getProducts();
  }

}