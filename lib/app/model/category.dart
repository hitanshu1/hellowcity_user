
import 'package:meta/meta.dart';

class CategoryModel {
  CategoryModel({ this.name,  this.imageUrl,this.direct:false,this.subCategory,this.val});

  final String? name;
  final String?  imageUrl;
  final String? subCategory;
  final String? val;
  final bool direct;

  factory CategoryModel.fromMap(Map<dynamic, dynamic> data) {
    final String name = data['name'];
    final String imageUrl = data['imageUrl'];
    final bool direct=data['direct'];
    return CategoryModel(

      name: name,
      imageUrl: imageUrl,
      direct: direct
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'direct':direct
    };
  }
}