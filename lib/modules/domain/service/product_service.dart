import 'package:wp_commerce_1/modules/domain/model/Product.dart';

abstract class ProductService {
  Future<List<Product>> getProducts();
}