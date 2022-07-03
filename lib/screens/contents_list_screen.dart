import 'package:flutter/material.dart';
import 'package:benesse_tanaka/constants.dart';
import 'package:benesse_tanaka/screens/image_content_post_screen.dart';
import 'package:benesse_tanaka/screens/content_view_screen.dart';
import 'package:benesse_tanaka/screens/memo_content_post_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
// FirebaseUser loggedInUser;

class ContentsListScreen extends StatefulWidget {
  static const String id = 'contents_list_screen';
  @override
  _ContentsListScreenState createState() => _ContentsListScreenState();
}

class _ContentsListScreenState extends State<ContentsListScreen> {
  final messageTextController = TextEditingController();
  // final _auth = FirebaseAuth.instance;
  int _selectedIndex = 0;
  Widget _selectedPage = ContentsListScreen();
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() {
      setState(() {
        print('initilize completed');
      });
    });

    _pages = [
      ContentsListScreen(),
      ImageContentPostScreen(),
      MemoContentPostScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_circle_rounded),
              onPressed: () {
                // Navigator.pushNamed(
                //     context,
                //     ImageContentPostScreen.id,
                //     arguments: ScreenArguments(
                //
                //     ),
                // );
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('投稿一覧'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            label: '画像投稿',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.turned_in_not),
            label: 'メモ投稿',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue[700],
        onTap: (int index){
          setState(() {
            _onItemTapped(index);
          });
        },
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('list_contents').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        // List<MessageBubble> contentLists = [];

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: snapshot.data!.docs
                .map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return MessageBubble(
                      title: data['title'],
                      text_first: data['text_first'],
                      text_second: data['text_second'],
                      image_url: data['image_url'],
                      classification: data['classification'],
                      author: data['author'],
                    );
            })
            .toList()
            .cast(),
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.title = 'default_title',
    this.text_first = 'default_text_first',
    this.text_second = 'default_text_second',
    this.image_url = 'default_image_url',
    this.classification = 'default_classification',
    this.author = 'default_author'});

  final String title;
  final String text_first;
  final String text_second;
  final String image_url;
  final String classification;
  final String author;



  @override
  Widget build(BuildContext context) {
    final Map para = {
      'title': title,
      'text_first': text_first,
      'text_second': text_second,
      'image_url': image_url,
      'classification': classification,
      'author': author,
    };
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ContentViewScreen.id,
                  arguments: ScreenArguments(
                    title,
                    text_first,
                    text_second,
                    image_url,
                    classification,
                    author,
                  ),
                );
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  image_url,
                  height: 200.0,
                  width: 100.0,
                ),
              ),
              title: Text(title),
              subtitle: Row(
                children: [
                  Text(author),
                  SizedBox(width: 8),
                  Text(text_second),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 15),
                Expanded(
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Colors.grey, style: BorderStyle.solid)),
                    child: Center(
                      child: Text(
                        classification,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 70),
                TextButton(
                  child: Text('編集'),
                  onPressed: () {/* ... */},
                ),
                SizedBox(width: 8),
                TextButton(
                  child: Text('削除'),
                  onPressed: () {/* ... */},
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
          ),
        ),
      ],
    );

  }
}




// @override
// Widget build(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.all(10.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: <Widget>[
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12.0,
//             color: Colors.black54,
//           ),
//         ),
//         Material(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.0),
//             bottomLeft: Radius.circular(30.0),
//             bottomRight: Radius.circular(30.0),
//           ),
//           elevation: 5.0,
//           color: Colors.lightBlueAccent,
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//             child: Text(
//               text_first,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15.0,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
// }