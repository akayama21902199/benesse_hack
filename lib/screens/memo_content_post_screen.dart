import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:benesse_tanaka/screens/contents_list_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class MemoContentPostScreen extends StatelessWidget {
  static const String id = 'memo_content_post_screen';
  late String title;
  late String text_first;
  late String text_second;
  late String image_url;
  late String classification;
  late String author;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('メモ投稿画面'),
        ),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: _screenSize.width * 0.85,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "title",

                        ),
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 30,),
            //ここまで子0
            Container(
                width: double.infinity,
                child: Column(
/*                crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "覚えるべきポイント",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    Container(
                      width: _screenSize.width * 0.85,
                      child: TextField(
                        decoration: InputDecoration(),
                        maxLines: 2,
                        onChanged: (value) {
                          text_first = value;
                        },
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 30,),
            //ここまで子1
            Container(
                width: double.infinity,
                child: Column(
/*                crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "覚え方",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                    Container(
                      width: _screenSize.width * 0.85,
                      child: TextField(
                        decoration: InputDecoration(),
                        maxLines: 2,
                        onChanged: (value) {
                          text_second = value;
                        },
                      ),
                    ),
                  ],
                )
            ),
//             SizedBox(height: 30,),
//             //ここまで子2
//             Container(
//                 width: double.infinity,
//                 child: Column(
// /*                crossAxisAlignment: CrossAxisAlignment.start,*/
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                           "ここは注意!!",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           )),
//                     ),
//                     Container(
//                       width: _screenSize.width * 0.85,
//                       child: TextField(
//                         decoration: InputDecoration(),
//                         maxLines: 2,
//                       ),
//                     ),
//                   ],
//                 )
//             ),
            SizedBox(height: 50,),
            //ここまで子3
            TextButton(
                child: Text("Register"),
                onPressed: () {
                  _firestore.collection('list_contents').add({
                    'title': title,
                    'text_first': text_first,
                    'text_second': text_second,
                    'image_url': 'data:image/jpeg;base64,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',
                    'classification': '暗記',
                    'author': '鈴木一郎',
                  });
                  Navigator.pushNamed(
                      context,
                      ContentsListScreen.id,
                  );
                },
            ),
          ],
        )
/*      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
                "覚えるべきポイント",
            style: TextStyle(
            fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
        )),
            TextField(
              decoration: InputDecoration(
                hintText: "内容",
              ),
            ),
            TextField(
            ),
            RaisedButton(
                child: Text("register"),
                onPressed: () {

                },
            ),
          ],
        ),
        ddd

      ),*/

    );
  }
}