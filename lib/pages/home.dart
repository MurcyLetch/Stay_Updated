import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stay_updated/helper/data.dart';
import 'package:stay_updated/helper/news.dart';
import 'package:stay_updated/models/article_model.dart';
import 'package:stay_updated/models/category_model.dart';
import 'package:stay_updated/pages/article_view.dart';
import 'package:google_fonts/google_fonts.dart';

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
              color:Colors.deepOrange
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
      drawer:Drawer(
      child: Container(
        color:Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //header part begins
            DrawerHeader(
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                accountName: Text('Arijit Indu'),
                accountEmail: Text('arijitindu99@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://s3.amazonaws.com/codechef_shared/sites/default/files/uploads/pictures/334b188cd3f98dc56255855be2b138ae.jpeg"),
                  ),
              ), 
           ),
            //header part ends
            ListTile(
              leading: Icon(
                Icons.home,
                color:Colors.white,
              ),
              title: Text(
                "Kolkata",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),

            ListTile(
              leading: Icon(
                Icons.chat,
                color:Colors.white,
              ),
              title: Text(
                "9836760223",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),

              ListTile(
              leading: Icon(
              Icons.mail,
                color:Colors.white,
              ),
              title: Text(
                "Mail me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white, 
                  ),
              )
              ),

              SizedBox(height: 60.0,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                child: Center(
                  child: Text(
                    "\"If you were born with the ability to change someone’s perspective or emotions, never waste that gift. It is one of the most powerful gifts God can give—the ability to influence\"",
                    textScaleFactor: 1.4,
                    style: GoogleFonts.poppins(
                      color:Colors.white,
                    ),))),

          ],
        ),
      ),
    ),
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
                imageUrl:imageurl,width: 150,height:80,fit:BoxFit.cover)
              ),
            Container(
              alignment: Alignment.center,
              width:150,height: 80,
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