import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_rats/modules/dashboard/view/dashboard.dart';
import 'package:gym_rats/modules/evolution/view/evolucao.dart';
import 'package:gym_rats/modules/home/view/home_page.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';
import 'package:gym_rats/modules/training/view/new_training.dart';
import 'package:gym_rats/modules/training/view/training_form.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/usuariosModel.dart';
import 'modules/dashboard/view/meta_cadastro.dart';
import 'modules/evolution/view/evolucao_cadastro.dart';
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
      debugShowCheckedModeBanner: false,
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
    return ScopedModel<Usuario>(
      model: Usuario(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        initialRoute: '/login',
        routes: {
          // ignore: missing_required_param
          '/login': (context) => LoginPage(),
          '/signin': (context) => SigninPage(),
          '/newtraining': (context) => NewTrainingPage(),
          '/training_form': (context) => TrainingForm(),
          '/evolucao': (context) => EvolucaoPage(),
          '/evolucao_cadastro': (context) => EvolucaoForm(),
          '/home': (context) => HomePage(),
          '/dashboard': (context) => DashboardPage(),
          '/meta_cadastro': (context) => MetaForm(),
        },
      ),
    );
  }
}
