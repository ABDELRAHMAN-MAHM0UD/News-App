import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories=1;
  static const int settings=2;
  Function onSideMenuClick;
  HomeDrawer({required this.onSideMenuClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical:
          MediaQuery.of(context).size.height*.08, ),
          width: double.infinity,
          color: appColors.primaryColor,
          child: Text("News App",style: TextStyle(color: appColors.white,
          fontSize: 24),textAlign: TextAlign.center,)
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuClick(categories);
            },
            child: Row(
              children: [
                    Icon(Icons.list,size: 30,),
                SizedBox(width: 10,),
                Text("Categories",style: TextStyle(fontSize: 22),)
              ],
            ),
          ),
        ),     Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              onSideMenuClick(settings);
            },
            child: Row(
              children: [
                    Icon(Icons.settings,size: 25,),
                SizedBox(width: 10,),
                Text("Settings",style: TextStyle(fontSize: 22),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
