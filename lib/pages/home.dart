import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        child:  ,
      ),
    );
  }
}

class Categorytile extends StatelessWidget {
 final imageurl,categoryname;
 Categorytile({this.imageurl,this.categoryname});
 @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(imageurl,width: 120,height:60),
        ],
      ),
    );
  }
}