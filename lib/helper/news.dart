import 'dart:convert';

import 'package:stay_updated/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<Articlemodel> news=[];
  Future<void>getnews() async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e1fa5c9782714e3cbdfccd8bf6b07d7e";
    var response=await http.get(Uri.parse(url));  //see once more
    //var response=await http.get(url);
    var jsondata =jsonDecode(response.body);
    if(jsondata['status']=="ok"){
     // print(jsondata);
      jsondata["articles"].forEach((element){
        //print(element);
        if(element["urlToImage"]!=null && element['description']!=null){
          print("ghusssss");
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
      //print(news);
    }
  }
}