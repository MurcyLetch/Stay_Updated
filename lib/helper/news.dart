import 'dart:convert';

import 'package:stay_updated/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<Articlemodel> news=[];
  Future<void>getnews() async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e1fa5c9782714e3cbdfccd8bf6b07d7e";
    var response=await http.get(url);  //see once more

    var jsondata =jsonDecode(response.body);
    if(jsondata['status']=="ok"){
      jsondata["articles"].forEach((element){
        if(element["urlToimage"]!=null && element['description']!=null){
          Articlemodel articlemodel=Articlemodel(
            title: element['title'],
            author:  element['author'],
            description:  element['description'],
            url:  element['url'],
            urlToImage:  element['urlToImage'],
            content:  element['content'],
          );
          news.add(articlemodel);
        }

      });
    }
  }
}