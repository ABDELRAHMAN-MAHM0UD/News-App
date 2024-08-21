import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/Home%20Page/categoruItem.dart';

import '../model/Category.dart';

class Categoryfragment extends StatelessWidget {

  var categoriesList = Cateigory.getCategories();
  Function onCategoryItemClick;
  Categoryfragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          Text("pick your category",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          Expanded(
            child: GridView.builder(

              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2 ,
              ) ,
              itemBuilder:(context,index){
                return InkWell(
                    onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(category:categoriesList[index] ,index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
