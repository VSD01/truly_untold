import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BlogsController extends GetxController {

  /// all hover related variables 
  bool isMainHover=false;
  /// 
  Stream<List<BlogsResponse>> allBlogs() => FirebaseFirestore.instance
      .collection('blogs')
      .snapshots()
      .map((snapShot) => snapShot.docs
          .map((doc) => BlogsResponse.fromJson(doc.data()))
          .toList());
}



class BlogsResponse {
  BlogsResponse({
    required this.descriptionPara1,
    required this.descriptionPara2,
    required this.date,
    required this.id,
    required this.subtitle,
    required this.title,
    required this.coverImage,
    required this.image2,
    required this.image3,
    required this.image4,
  });
  String id;
  final String title;
  final String descriptionPara1;
  final String descriptionPara2;
  final String date;
  final String subtitle;
  final String coverImage;
  final String image2;
  final String image3;
  final String image4;

  static BlogsResponse fromJson(Map<String, dynamic> json) => BlogsResponse(
        descriptionPara1: json['descriptionPara1'],
        descriptionPara2: json['descriptionPara2'],
        date: json['date'],
        id: json['id'],
        subtitle:json['subTitle'],
        title: json['title'],
        coverImage: json['coverImage'],
        image2: json['image2'],
        image3: json['image3'],
        image4: json['image4'],
      );
}
