import 'package:flutter/material.dart';
import 'package:gym_rats/modules/home/view/home_page.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';

import 'modules/login/view/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Rats',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF242424)),
      home: MyHomePage(title: 'Gym Rats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signin': (context) => SigninPage(),
        '/': (context) => HomePage(),
      },
    );
  }
}
