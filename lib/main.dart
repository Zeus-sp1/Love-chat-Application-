import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:love_chat/view/calls_page.dart';
import 'package:love_chat/view/chat_screen.dart';
import 'package:love_chat/view/login_screen.dart';
import 'package:love_chat/view/registration_screen.dart';
import 'package:love_chat/view/welcome_screen.dart';

// void main() => runApp(LoveChat());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(LoveChat());
}

class LoveChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     body1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        CallPage.id: (context) => CallPage(),
      },
    );
  }
}
