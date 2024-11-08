import 'package:get/get.dart';
import 'package:wp_commerce_1/interfaces/BaseHttp.dart';
import 'package:wp_commerce_1/modules/domain/exceptions/bad_request_exception.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/providers/dto/filter_product_dto.dart';
import 'package:wp_commerce_1/modules/domain/providers/product_provider.dart';
import 'package:wp_commerce_1/modules/providers/dto/product_data_dto.dart';
import 'package:wp_commerce_1/modules/providers/dto/product_filter_provider.dart';
import 'package:wp_commerce_1/modules/providers/mappers/img_mapper.dart';
import 'package:wp_commerce_1/modules/providers/mappers/product_price_mapper.dart';

class ProductProviderImpl extends ProductProvider {
  var http = Get.put(BaseHttp());

  @override
  Future<List<Product>> getProducts(FilterProduct? filter) async {

    ProductFilterProvider filterDto = ProductFilterProvider(
      search: filter?.search,
      maxPrice: filter?.maxPrice,
      minPrice: filter?.minPrice
    );

    var request = await http.get("/wc/store/products", query: filterDto.toJson());

    if (request.hasError) {
      throw BadRequestException("Error trying to get products");
    }

    var products = List.from(request.body);
    return products.map((item) {
      var productDto = ProductDataDto.fromJson(item);
      return Product(
        name: productDto.name,
        id: productDto.id,
        images: ImgMapper.dtoToImages(productDto.images),
        price: ProductPriceMapper.toPrice(productDto.prices)
      );
    }).toList();
  }
}
