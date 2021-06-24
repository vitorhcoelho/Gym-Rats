import 'package:flutter/material.dart';
import 'package:gym_rats/modules/home/view/home_page.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';
import 'package:gym_rats/modules/training/view/new_training.dart';
import 'package:gym_rats/modules/training/view/training_form.dart';
import 'package:gym_rats/providers/trainings.dart';
import 'package:provider/provider.dart';
import 'modules/sign_up/view/sign_up_page.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Trainings(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/newtraining',
        routes: {
          // ignore: missing_required_param
          '/login': (context) => LoginPage(),
          '/signin': (context) => SigninPage(),
          '/newtraining': (context) => NewTrainingPage(),
          '/training_form': (context) => Training_form(),
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
