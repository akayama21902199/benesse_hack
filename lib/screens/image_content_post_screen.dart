import 'package:flutter/material.dart';
import 'package:benesse_tanaka/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ImageContentPostScreen extends StatefulWidget {
  static const String id = 'image_content_post_screen';
  late String title;
  late String text_first;
  late String text_second;
  late String image_url;
  late String classification;
  late String author;

  @override
  _ImageContentPostScreenState createState() => _ImageContentPostScreenState();
}

class _ImageContentPostScreenState extends State<ImageContentPostScreen> {
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    int count = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text('画像投稿画面'),
        ),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: _screenSize.width * 0.85,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "title"
                        ),
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
                          "投稿内容",
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
                      ),
                    ),
                  ],
                )
            ),
//               SizedBox(height: 30,),
//               //ここまで子1
//
//               // if (count % 2 == 0) {
//               //   SizedBox(height: 50,width: 50)
//               // } else {
//               //   Image.asset("images/note.png")
//               // }
          ]
        )
    );
  }
}
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () {
//                 // _auth.signOut();
//                 Navigator.pop(context);
//               }),
//           IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 // _firestore.collection('card_contents').add({
//                 //   'image_url': 'data:image/jpeg;base64,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',
//                 //   'text_first': 'firsttext',
//                 //   'text_second': 'secondtext',
//                 //   'title': 'ktitle',
//                 // });
//               }),
//         ],
//         title: Text(args.title),
//         backgroundColor: Colors.lightBlueAccent,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(args.text_first),
//             Text(args.text_second),
//             Text('created by ${args.author}'),
//             Text(args.classification),
//             // MessagesStream(),
//             // Container(
//             //   decoration: kMessageContainerDecoration,
//             //   child: Row(
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: <Widget>[
//             //       Expanded(
//             //         child: TextField(
//             //           controller: messageTextController,
//             //           onChanged: (value) {
//             //             messageText = value;
//             //           },
//             //           decoration: kMessageTextFieldDecoration,
//             //         ),
//             //       ),
//             //       TextButton(
//             //         onPressed: () {
//             //           messageTextController.clear();
//             //           _firestore.collection('messages').add({
//             //             'text': messageText,
//             //             'sender': loggedInUser.email,
//             //           });
//             //         },
//             //         child: Text(
//             //           'Send',
//             //           style: kSendButtonTextStyle,
//             //         ),
//             //       ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// // class MessagesStream extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _firestore.collection('messages').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) {
// //           return Center(
// //             child: CircularProgressIndicator(
// //               backgroundColor: Colors.lightBlueAccent,
// //             ),
// //           );
// //         }
// //         final messages = snapshot.data.documents.reversed;
// //         List<MessageBubble> messageBubbles = [];
// //         for (var message in messages) {
// //           final messageText = message.data['text'];
// //           final messageSender = message.data['sender'];
// //
// //           final currentUser = loggedInUser.email;
// //
// //           final messageBubble = MessageBubble(
// //             sender: messageSender,
// //             text: messageText,
// //             isMe: currentUser == messageSender,
// //           );
// //
// //           messageBubbles.add(messageBubble);
// //         }
// //         return Expanded(
// //           child: ListView(
// //             reverse: true,
// //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
// //             children: messageBubbles,
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class MessageBubble extends StatelessWidget {
// //   MessageBubble({this.sender, this.text, this.isMe});
// //
// //   final String sender;
// //   final String text;
// //   final bool isMe;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.all(10.0),
// //       child: Column(
// //         crossAxisAlignment:
// //         isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// //         children: <Widget>[
// //           Text(
// //             sender,
// //             style: TextStyle(
// //               fontSize: 12.0,
// //               color: Colors.black54,
// //             ),
// //           ),
// //           Material(
// //             borderRadius: isMe
// //                 ? BorderRadius.only(
// //                 topLeft: Radius.circular(30.0),
// //                 bottomLeft: Radius.circular(30.0),
// //                 bottomRight: Radius.circular(30.0))
// //                 : BorderRadius.only(
// //               bottomLeft: Radius.circular(30.0),
// //               bottomRight: Radius.circular(30.0),
// //               topRight: Radius.circular(30.0),
// //             ),
// //             elevation: 5.0,
// //             color: isMe ? Colors.lightBlueAccent : Colors.white,
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(
// //                   color: isMe ? Colors.white : Colors.black54,
// //                   fontSize: 15.0,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }