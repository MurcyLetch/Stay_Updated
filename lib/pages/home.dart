import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stay_updated/helper/data.dart';
import 'package:stay_updated/helper/news.dart';
import 'package:stay_updated/models/article_model.dart';
import 'package:stay_updated/models/category_model.dart';
import 'package:stay_updated/pages/article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  List<Categorymodel>categories=new List<Categorymodel>();
  // ignore: deprecated_member_use
  List<Articlemodel>articles=new List<Articlemodel>();
  bool _loading=true;
  @override
  void initState() { 
    super.initState();
    categories=getcatagories();
    getnews();
  }
  getnews() async {
    News newsClass=News();
    await newsClass.getnews();
    articles=newsClass.news;
    //print(articles);
    setState(() {
          _loading=false;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stay '),
            Text('Updated',style: TextStyle(
              color:Colors.blue,
            ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child:CircularProgressIndicator(),
        ),
      ) : solve(),
    );
  }

SingleChildScrollView solve() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Categorytile(
                    imageurl: categories[index].imageurl,
                    categoryname: categories[index].categoryname,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Blogtile(
                  imageurl: articles[index].urlToImage,
                   title: articles[index].title, 
                   desc: articles[index].description,
                   url:articles[index].url
                   );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



class Categorytile extends StatelessWidget {
 final imageurl,categoryname;
 Categorytile({this.imageurl,this.categoryname});
 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin:EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl:imageurl,width: 120,height:60,fit:BoxFit.cover)
              ),
            Container(
              alignment: Alignment.center,
              width:120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:Colors.black26,
              ),
                child: Text(categoryname,style: 
                TextStyle(
                  color:Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}

class Blogtile extends StatelessWidget {

  final String imageurl,title,desc,url;

  Blogtile({@required this.imageurl,@required this.title,@required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Articleview(
            blogurl:url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
            child: Image.network(imageurl)),
            SizedBox(height: 8,),
            Text(title,style:TextStyle(
              fontSize: 18,
              color:Colors.black87, 
              fontWeight: FontWeight.w500,
            )),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
            color:Colors.black54
            ),),
          ],
        ),
      ),
    );
  }
}