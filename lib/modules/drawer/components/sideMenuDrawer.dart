import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/home/view/home_page.dart';
import 'package:gym_rats/modules/training/view/new_training.dart';
import 'package:scoped_model/scoped_model.dart';

class SideMenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: 10.0,
        color: Color(0xFF121212),
        child: ListView(
          children: [
            Container(
              height: 50.0,
              child: DrawerHeader(
                  child: Container(
                    child: Text(
                      'Usuário',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 0.0, top: 10.0, left: 10.0),
                  padding: EdgeInsets.only(bottom: 0.0, top: 10.0, left: 10.0)),
            ),
            const Divider(
              height: 20,
              thickness: 0.2,
              indent: 20,
              endIndent: 20,
              color: Color(0xFFCDCDCD),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xFFCDCDCD),
              ),
              title: Text('Home',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              onTap: () => HomePage(),
              focusColor: Color(0xFFDF9F17),
            ),
            ListTile(
              leading: Icon(
                Icons.trending_up,
                color: Color(0xFFCDCDCD),
              ),
              title: Text('Evolução',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              onTap: () => {Navigator.of(context).pop()},
              focusColor: Color(0xFFDF9F17),
            ),
            ListTile(
              leading: Icon(
                Icons.fitness_center,
                color: Color(0xFFCDCDCD),
              ),
              title: Text('Treinos',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewTrainingPage()))
              },
              focusColor: Color(0xFFDF9F17),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xFFCDCDCD),
              ),
              title: Text('Configurações',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              onTap: () => {Navigator.of(context).pop()},
              focusColor: Color(0xFFDF9F17),
            ),
            ScopedModelDescendant<Usuario>(builder: (context, child, model) {
              if (model.isLoading)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xFFCDCDCD),
                ),
                title: Text('Sair',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onTap: () {
                  model.signOut(context);
                },
                focusColor: Color(0xFFDF9F17),
              );
            })
          ],
        ),
      ),
    );
  }
}
