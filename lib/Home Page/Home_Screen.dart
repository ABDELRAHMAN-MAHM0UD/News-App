import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/API/apiManager.dart';
import 'package:news/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/taps/taps.dart';


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
        leading:
           IconButton(icon: Icon(Icons.table_rows,color: appColors.white,) ,onPressed:(){},
        ),
        title: Text(AppLocalizations.of(context)!.news,
          style: Theme.of(context).textTheme.titleMedium,),
        actions: [Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Icons.search,color: appColors.white,))],
        centerTitle: true,
      ) ,
      body: FutureBuilder<SourceResponse?>(
        future: APIManager.gerSources(),
        builder:(context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
            color: appColors.primaryColor,));
        }
        else if(snapshot.hasError){
          return Expanded(
            child: Column(
              children: [
                Text("Something went wrong"),
                ElevatedButton(onPressed: (){
                  setState(() {
                    APIManager.gerSources();
                  });
                },
                      child: Text("Try again"))
              ],
            ),
          );
          }
        if(snapshot.data!.status != 'ok'){
          return Expanded(
            child: Column(
              children: [
                Text(snapshot.data!.messege!),
                ElevatedButton(onPressed: (){
                  setState(() {
                    APIManager.gerSources();
                  });
                },
                    child: Text("Try again"))
              ],
            ),
          );
        }
        var sourceList = snapshot.data!.sources!;

            return Taps(sourceList: sourceList);

        },
      ),

    );
  }
}
