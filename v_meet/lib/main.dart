import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:v_meet/resources/auth_methods.dart';
import 'package:v_meet/screens/home_page.dart';
import 'package:v_meet/screens/login_screen.dart';
import 'package:v_meet/screens/video_call_screen.dart';
import 'package:v_meet/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VMeet',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/video_call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authStateChanges,  
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if(snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginScreen();
          }
        }
      )
    );
  }
}
