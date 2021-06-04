import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articleview extends StatefulWidget {

  final String blogurl;

  const Articleview({Key key, this.blogurl}) : super(key: key);
  
  @override
  _ArticleviewState createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:WebView(
        initialUrl: widget.blogurl,
      )
    );
  }
}