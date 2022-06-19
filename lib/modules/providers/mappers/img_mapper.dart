import 'package:wp_commerce_1/modules/domain/model/Img.dart';
import 'package:wp_commerce_1/modules/providers/dto/img_dto.dart';

class ImgMapper {
  static Img dtoToImg(ImgDto img) => Img(id: img.id, src: img.src, thumbnail: img.thumbnail, name: img.name);

  static List<Img> dtoToImages(List<ImgDto> images) => images.map((e) => dtoToImg(e)).toList();
}