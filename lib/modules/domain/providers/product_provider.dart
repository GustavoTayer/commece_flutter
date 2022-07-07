import 'package:wp_commerce_1/modules/domain/providers/dto/filter_product_dto.dart';

import '../model/Product.dart';

abstract class ProductProvider {
  Future<List<Product>> getProducts(FilterProduct? filter);
}