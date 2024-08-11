import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news/API/apiManager.dart';
import 'package:news/colors.dart';
import 'package:news/model/NewsResponse.dart';
import '../model/SourceResponse.dart';
import '../taps/taps.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: APIManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: appColors.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something went wrong"),
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

        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
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

        var newsList = snapshot.data!.articles!;

        return ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return Text(newsList[index].title ?? ' ',style: TextStyle(fontSize: 22),);
          },
        );
      },
    );
  }
}
