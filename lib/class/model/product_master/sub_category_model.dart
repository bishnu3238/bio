import 'package:universal_lab/class/model/product_master/catergory_model.dart';

class SubCategoryModel extends CategoryModel {
  final String subCategoryId;

  SubCategoryModel({
    required this.subCategoryId,
    required super.id,
    required super.name,
    required super.image,
    required super.status,
  });
}
