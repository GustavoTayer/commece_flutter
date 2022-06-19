import 'package:wp_commerce_1/modules/domain/model/price.dart';
import 'package:wp_commerce_1/modules/providers/dto/product_price_dto.dart';

class ProductPriceMapper {
  static Price toPrice(ProductPriceDto dto) => Price(
        value: int.parse(dto.price),
        currencyCode: dto.currencyCode,
        currencySymbol: dto.currencySymbol,
        decimalSeparator: dto.decimalSeparator,
        thousandSeparator: dto.thousandSeparator,
        prefix: dto.prefix,
        suffix: dto.suffix,
      );
}
