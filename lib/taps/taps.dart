import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/taps/OneTab.dart';

import '../Home Page/News_Widget/newsWidget.dart';

class Taps extends StatefulWidget {
  List<Sources> sourceList ;

  Taps({required this.sourceList});

  @override
  State<Taps> createState() => _TapsState();
}

class _TapsState extends State<Taps> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs:
                  widget.sourceList.map((Sources) => Onetab(
                  source: Sources,
                  isSelected: selectedIndex== widget.sourceList.indexOf(Sources))).toList()
            ),
            Expanded(child:
            NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
