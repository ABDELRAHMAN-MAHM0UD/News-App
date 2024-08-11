import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/API/apiConstans.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class APIManager{
  /*https://newsapi.org/v2/top-headlines/sources?apiKey=0c276aee08f9428b8d697b0b4be4c07d*/

  static Future<SourceResponse?> gerSources()async{
        Uri url = Uri.https(ApiConstans.baseUrl,ApiConstans.sourcesApi,
          {
            "apiKey": "0c276aee08f9428b8d697b0b4be4c07d"
          }
        );
        var response =await http.get(url);
        try{
          return SourceResponse.fromJson(jsonDecode(response.body));
        }
        catch(e){
          throw e;
        }
}

static Future<NewsResponse?> getNewsBySourceId(String Id)async{
    ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=0c276aee08f9428b8d697b0b4be4c07d
    Uri url = Uri.https(
        ApiConstans.baseUrl,'/v2/everything',{
          'apiKey':'0c276aee08f9428b8d697b0b4be4c07d',
          'sources':Id
    });
    var response = await http.get(url);
    try{
      return NewsResponse.fromJson(jsonDecode(response.body));

    }
    catch(e){
      throw e;
    }
    }

}
