import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_rats/models/evolucaoModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class MetaTile extends StatefulWidget {
  @override
  _MetaTileState createState() => _MetaTileState();
}

class _MetaTileState extends State<MetaTile> {
  String mensagem = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EvolucaoModel>(
        model: EvolucaoModel(Usuario.of(context).firebaseUser),
        child: ScopedModelDescendant<EvolucaoModel>(
            builder: (context, child, model) {
          mensagem = model.mensagem;
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF272727),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF121212).withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 20,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      mensagem,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
