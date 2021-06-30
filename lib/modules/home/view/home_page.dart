import 'package:flutter/material.dart';
import 'package:gym_rats/models/item.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../drawer/components/sideMenuDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> itens;
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ScopedModel<TreinosModel>(
        model: TreinosModel(Usuario.of(context).firebaseUser),
        child: ScopedModelDescendant<TreinosModel>(
            builder: (context, child, model) {
          this.itens = model.itens;
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Scaffold(
              drawerScrimColor: Colors.transparent,
              drawer: SideMenuDrawer(),
              backgroundColor: Color(0xFF242424),
              appBar: AppBar(
                title: Text('Home'),
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
              body: ListView(
                children: <Widget>[
                  _buildPanel(),
                ],
              ));
        }));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          print(itens[index].isExpanded);
          itens[index].isExpanded = !isExpanded;
          isExpanded = !isExpanded;
          print(itens[index].isExpanded);
        });
      },
      children: itens.map((Item item) {
        return ExpansionPanel(
          isExpanded: item.isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(item.headerValue));
          },
          body: ListTile(title: Text(item.expandedValue)),
        );
      }).toList(),
    );
  }
}
