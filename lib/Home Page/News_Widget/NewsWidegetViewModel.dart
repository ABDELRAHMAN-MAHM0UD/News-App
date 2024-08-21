import 'package:flutter/cupertino.dart';
import 'package:news/API/apiManager.dart';
import 'package:news/model/NewsResponse.dart';

import '../news.dart';

class NewsWidegetViewModel extends ChangeNotifier {
List<Articles>? newList ;
String? errorMessage;

  void getNewsBySourceId(String sourceId)async{
    try {
      var response = await APIManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      }
      else {
        newList = response!.articles;
      }
    }
    catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
