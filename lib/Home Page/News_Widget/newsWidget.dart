import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news/API/apiManager.dart';
import 'package:news/Home%20Page/News_Widget/NewsWidegetViewModel.dart';
import 'package:news/Home%20Page/news.dart';
import 'package:news/colors.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:provider/provider.dart';
import '../../model/SourceResponse.dart';
import '../../taps/taps.dart';
import '../categoryFragment.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidegetViewModel viewModel = NewsWidegetViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>viewModel ,
      child:Consumer<NewsWidegetViewModel>(
          builder:(context,viewModel,child){
    if(viewModel.errorMessage != null){
    return Column(
    children: [
    Text("${viewModel.errorMessage!} this is"),
    ElevatedButton(
    onPressed: () {
    setState(() {
    APIManager.getNewsBySourceId(widget.source.id ?? '');
    });
    },
    child: Text("Try again"),
    )
    ],
    );
    }
    if(viewModel.newList == null){
    return Center(
    child: CircularProgressIndicator(
    color: appColors.primaryColor,
    ),
    );

    }
    else{
    return ListView.builder(
    itemBuilder: (context, index) {
    News(articles: viewModel.newList![index]);
    },
    itemCount: viewModel.newList!.length,
    );
    }
    }
      )
    );
  }
}
