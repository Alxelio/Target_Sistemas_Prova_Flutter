import 'package:flutter/material.dart';

void main(){
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF1F5466), //rgba(31,84,102,255)
             Color(0xFF2D958E)], // rgba(45,149,142,255)
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}

//Color(0xFF44BD6E)       rgba(68,189,110,255) verde