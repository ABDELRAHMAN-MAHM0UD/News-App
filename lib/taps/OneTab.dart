import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/model/SourceResponse.dart';

class Onetab extends StatelessWidget {
  bool isSelected ;
  Sources source;
  Onetab({ required this.source ,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: appColors.primaryColor,width: 3),
        color:
        isSelected == true ?
        appColors.primaryColor:
        Colors.transparent,
      ),
        child: Text(source.name ?? "",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isSelected ?
              appColors.white:
              appColors.primaryColor
        ) ,),
    );
  }
}
