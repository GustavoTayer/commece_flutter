import 'package:wp_commerce_1/modules/domain/model/price.dart';

import 'Img.dart';

class Product {
  String name;
  int id;
  List<Img> images;
  Price price;

  Product({
    required this.name,
    required this.id,
    required this.images,
    required this.price,
  });
}
