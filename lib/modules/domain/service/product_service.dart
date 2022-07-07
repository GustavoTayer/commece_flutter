import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/providers/dto/filter_product_dto.dart';

abstract class ProductService {
  Future<List<Product>> getProducts(FilterProduct? filter);
}