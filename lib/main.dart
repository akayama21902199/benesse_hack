import 'package:flutter/material.dart';
import 'package:benesse_tanaka/screens/contents_list_screen.dart';
import 'package:benesse_tanaka/screens/image_content_post_screen.dart';
import 'package:benesse_tanaka/screens/memo_content_post_screen.dart';
import 'package:benesse_tanaka/screens/content_view_screen.dart';

void main() => runApp(ShareBrain());

class ShareBrain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: ContentsListScreen.id,
      home: ContentsListScreen(),
      // home: ContentViewScreen(),
      routes: {
        ImageContentPostScreen.id: (context) => ImageContentPostScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   RegistrationScreen.id: (context) => RegistrationScreen(),
      //   ChatScreen.id: (context) => ChatScreen(),
        ContentViewScreen.id: (context) => ContentViewScreen(),
        MemoContentPostScreen.id: (context) => MemoContentPostScreen(),
      },
    );
  }
}