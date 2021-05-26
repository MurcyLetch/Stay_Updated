import 'package:flutter/material.dart';
import 'package:stay_updated/helper/data.dart';
import 'package:stay_updated/helper/news.dart';
import 'package:stay_updated/models/article_model.dart';
import 'package:stay_updated/models/category_model.dart';

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
  }
  getnews() async {
    News newsClass=News();
    await newsClass.getnews();
    articles=newsClass.news;
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
      ) : Container(
        child: Column(
          children: [

            ////categories

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Categorytile(
                    imageurl: categories[index].imageurl,
                    categoryname: categories[index].categoryname,
                  );
                }
                ),
            )

            ////blogs


          ],
          ) ,
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
              child: Image.network(imageurl,width: 120,height:60,fit:BoxFit.cover)
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

  final String imageurl,title,desc;

  Blogtile({@required this.imageurl,@required this.title,@required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageurl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}