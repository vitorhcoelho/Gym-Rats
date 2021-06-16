import 'package:flutter/material.dart';
import 'package:gym_rats/modules/home/components/training.dart';
import '../../drawer/components/sideMenuDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SideMenuDrawer(),
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color(0xFFDF9F17)),
        ),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: Text(
                "Hoje",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          Training(),
        ],
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {},
          color: Color(0xFFDF9F17),
          child: Text("DESCANSO",
              style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ),
    );
  }
}
