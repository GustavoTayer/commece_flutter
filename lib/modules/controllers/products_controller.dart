import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/controllers/search_controller.dart';
import 'package:wp_commerce_1/modules/domain/model/Product.dart';
import 'package:wp_commerce_1/modules/domain/providers/dto/filter_product_dto.dart';
import 'package:wp_commerce_1/modules/domain/service/impl/product_service_impl.dart';
import 'package:wp_commerce_1/modules/domain/service/product_service.dart';

class ProductsController extends GetxController {

  SearchController searchController = Get.put(SearchController());
  ProductService productService = Get.put(ProductServiceImpl());

  var products = <Product>[].obs;
  var loading = false.obs;

  Future<void> getProducts(String? query) async {
    print('searching: $query');
    var productsResponse = await productService.getProducts(FilterProduct(search: query));
    products = productsResponse.obs;
    loading = false.obs;
    print("finished");
    update();
  }

  void changeLoading(bool value) {
    loading = value.obs;
  }

  @override
  void onInit() {
    changeLoading(true);
    getProducts(searchController.query.value);
    super.onInit();
  }
}