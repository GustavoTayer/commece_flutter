import 'package:get/get.dart';
import 'package:wp_commerce_1/interfaces/BaseHttp.dart';
import 'package:wp_commerce_1/modules/domain/exceptions/bad_request_exceptin.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/providers/product_provider.dart';
import 'package:wp_commerce_1/modules/providers/dto/product_data_dto.dart';

class ProductProviderImpl extends ProductProvider {
  var http = Get.put(BaseHttp());

  @override
  Future<List<Product>> getProducts() async {
    var request = await http.get("/wc/store/products");
    if(request.hasError) {
      print(request.body);
      throw BadRequestException("eita");
    }
    var algo = List.from(request.body);
    List<Product> products = algo.map((item) {
      var productDto = ProductDataDto.fromJson(item);
      return Product(name: productDto.name, id: productDto.id);
    }).toList();
    return products;
  }


}