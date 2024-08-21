import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import '../model/Category.dart';

class CategoryItem extends StatelessWidget {

  Cateigory category;
  int index;

CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: category.color,
            borderRadius:BorderRadius.only(
              topRight:Radius.circular(30) ,
                topLeft:Radius.circular(30) ,
                bottomLeft:Radius.circular(
                    index %2 == 0 ? 30 :0),
                bottomRight:Radius.circular(
            index %2 != 0 ? 30 :0),
                
            )
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.imgPath),
        
            Text(category.title,
              style: TextStyle(color: appColors.white,fontSize: 18),
              textAlign: TextAlign.end,)
          ],
        ),
      ),
    );
  }
}
