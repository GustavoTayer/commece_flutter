import '../model/Product.dart';

abstract class ProductProvider {
  Future<List<Product>> getProducts();
}