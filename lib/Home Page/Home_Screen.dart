import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/API/apiManager.dart';
import 'package:news/Home%20Page/categoryFragment.dart';
import 'package:news/Home%20Page/settingsTap.dart';
import 'package:news/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/darwer/homeDrawer.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/taps/taps.dart';

import '../model/Category.dart';
import 'category details/category details.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routName= "HomePage";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor: appColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
              bottomRight:Radius.circular(50))
        ),

        title: Text(
          selectedCategory==null?
          AppLocalizations.of(context)!.news:
          selectedCategory!.title
          ,
          style: Theme.of(context).textTheme.titleMedium,),
        actions: [Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Icons.search,color: appColors.white,))],
        centerTitle: true,
      ) ,
      drawer: Drawer(
          child: HomeDrawer(onSideMenuClick:onSideMenuClick ,)),

      body:selectedMenuItem ==  HomeDrawer.settings?
      Settingstap():
      selectedCategory == null?
      Categoryfragment  (onCategoryItemClick: onCategoryItemClick):
          CategoryDetails(category: selectedCategory!,)

    );
  }
  Cateigory? selectedCategory;
  void onCategoryItemClick(Cateigory newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }
  int selectedMenuItem=HomeDrawer.categories;
  onSideMenuClick(int newSideMenu){
  selectedMenuItem =newSideMenu;
  selectedCategory = null;
  Navigator.pop(context);
  setState(() {

  });
  }
}
