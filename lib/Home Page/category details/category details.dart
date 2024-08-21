import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Home%20Page/category%20details/Category_details_view_model.dart';
import 'package:news/model/Category.dart';
import 'package:provider/provider.dart';

import '../../API/apiManager.dart';
import '../../colors.dart';
import '../../model/SourceResponse.dart';
import '../../taps/taps.dart';

class CategoryDetails extends StatefulWidget {

  Cateigory category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => viewModel,
    child: Consumer<CategoryDetailsViewModel>(
      builder:(context,viewModel,child){
        if(viewModel.errormessage != null) {
         return Column(
            children: [
              Text(viewModel.errormessage!),
              ElevatedButton(onPressed: (){
                setState(() {
                  APIManager.getSources(widget.category.id);
                });
              },
                  child: Text("Try again"))
            ],
          );
        }
          if (viewModel.sourceList == null) {
            return Center(child: CircularProgressIndicator(
              color: appColors.primaryColor,));
          }
          else {
            return Taps(sourceList: viewModel.sourceList!);
          }

        }
       ,)
    );
  }
}
