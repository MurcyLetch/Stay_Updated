import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Articleview extends StatefulWidget {

  final String blogurl;

  const Articleview({Key key, this.blogurl}) : super(key: key);
  
  @override
  _ArticleviewState createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview> {

  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stay '),
            Text('Updated',style: TextStyle(
              color:Colors.deepOrange,
            ),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding:EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save)
              ),
          )
        ],
        elevation: 0.0,
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
      child:WebView(
        initialUrl: widget.blogurl,
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
        }),
      )
    ),
    ); 
  }
}