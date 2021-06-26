import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:gym_rats/modules/training/view/training_tile.dart';

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
        actions: <Widget>[
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
      body: ListView.builder(
          itemCount: 1, itemBuilder: (ctx, i) => TreinoTile(null)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/training_form');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
