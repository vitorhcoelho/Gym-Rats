import 'package:flutter/material.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:gym_rats/modules/training/components/box_training.dart';

class NewTrainingPage extends StatefulWidget {
  @override
  _NewTrainingPageState createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SideMenuDrawer(),
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color(0xFFDF9F17)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Center(
                  child: Text(
                    "Cadastro treino",
                    style: TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                ),
              ),
              BoxTraining(),
              BoxTraining(),
              BoxTraining(),
            ],
          ),
        ],
      ),
    );
  }
}
