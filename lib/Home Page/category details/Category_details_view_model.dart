import 'package:flutter/cupertino.dart';
import 'package:news/API/apiManager.dart';

import '../../model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Sources>? sourceList;
  String? errormessage;
  void getSources(String categoryId)async{
    sourceList = null;
    errormessage = null;
    notifyListeners();
    try{
      var response = await APIManager.getSources(categoryId);
      if(response?.status == 'error'){
        errormessage = response!.messege;
      }
      else{
        sourceList = response!.sources;
      }
    }
    catch(e){
       errormessage = "Can't load content";
    }
    notifyListeners();
  }
}