import 'dart:ui';

import 'package:news/colors.dart';

class Cateigory{
  String title;
  String id;
  String imgPath;
  Color color;

  Cateigory({required this.id ,required this.title ,
    required this.imgPath , required this.color});

  static List<Cateigory>getCategories(){
    return[
     /**/ Cateigory(id: "sports", title: "Sports", imgPath: "assets/images/sports.png", color: appColors.red),
     /**/ Cateigory(id: "health", title: "Health", imgPath: "assets/images/health.png", color: appColors.pink),
      Cateigory(id: "general", title: "general", imgPath: "assets/images/environment.png", color: appColors.lightBlue),
      Cateigory(id: "technology", title: "technology", imgPath: "assets/images/Politics.png", color: appColors.blue),
     /**/ Cateigory(id: "business", title: "Business", imgPath: "assets/images/bussines.png", color: appColors.browen),
      /**/Cateigory(id: "science", title: "Science", imgPath: "assets/images/science.png", color: appColors.yellow),
    ];
  }
}