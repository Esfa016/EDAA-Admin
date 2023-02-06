import 'package:cloud_firestore/cloud_firestore.dart';

class News
{
  String imgUrl;
  String newsTitle;
  String newsDescription;
  Timestamp createdAt;

  News({
    required this.imgUrl,
    required this.newsTitle,
    required this.newsDescription,
    required this.createdAt
  });

  Map<String, dynamic> toMap(News news) {
    return {
      'imgUrl': imgUrl,
      'NewsTitle': newsTitle,
      'NewsDescription': newsDescription,
      'CreatedAt': createdAt
    };
  }

}