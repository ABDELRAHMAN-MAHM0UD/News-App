import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/colors.dart';
import 'package:news/model/NewsResponse.dart';

class News extends StatelessWidget {
  Articles articles;

  News({required this.articles});

  @override
  Widget build(BuildContext context) {
    print("News class called");
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child:CachedNetworkImage(
                  height: MediaQuery.of(context).size.height*.28,
                  width: double.infinity,
                  fit: BoxFit.fill,
                imageUrl: articles.urlToImage??"",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: appColors.primaryColor,
                    )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
          ),
          Text(articles.author??"",
            style: TextStyle(color: Colors.grey),),

          Text(articles.title??"",style: TextStyle(fontSize: 20),),

          Text(articles.publishedAt??"",textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
