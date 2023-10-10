import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app2/ui/modules/web_view.dart';

Widget  buildArticleWidget(article,context) => InkWell(
  onTap: (){
   Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(article['url'])));
  },
  child:   Padding(

  padding:  EdgeInsets.all(16.0),

  child: Row(

  children: [

    article['urlToImage']!=null?Container(

  width: 120.0,

  height: 120.0,

  decoration: BoxDecoration(

  borderRadius: BorderRadius.circular(20),

  image: DecorationImage(

  image: NetworkImage(

    '${article['urlToImage']}'

  ),fit: BoxFit.cover)),

  ):Container(

      width: 120.0,

      height: 120.0,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),



    ),child: Center(child: Text('No Photo', style: Theme.of(context).textTheme.headlineLarge)),),

  SizedBox(

  width: 20.0,

  ),

  Expanded(

  child: Container(

  height: 120,

  child: Column(

  crossAxisAlignment: CrossAxisAlignment.start,

  children: [

  Expanded(

  child: Text(

  '${article['title']}',

  style: Theme.of(context).textTheme.headlineLarge,

  maxLines: 2,

  overflow: TextOverflow.ellipsis,

  )),

  Text(

  '${article['publishedAt']}',

  style: TextStyle(color: Colors.grey),

  )

  ],

  ),

  ),

  )

  ],

  ),

  ),
);