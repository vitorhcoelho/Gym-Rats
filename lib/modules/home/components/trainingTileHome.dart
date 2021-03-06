import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class TreinoHome extends StatelessWidget {
  final Treinos treino;

  const TreinoHome(this.treino);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TreinosModel>(
        model: TreinosModel(Usuario.of(context).firebaseUser),
        child: ScopedModelDescendant<TreinosModel>(
            builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Container(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    shadowColor: Colors.black,
                    child: Container(
                      height: 180,
                      width: 50,
                      color: Color(0xFF242424),
                      child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                              color: Color(0xFFDF9F17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      treino.nome.toString().capitalize(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(Icons.check),
                                    color: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text('Concluir Treino'),
                                          content: Text(
                                              'Tem certeza que deseja concluir o treino?'),
                                          actions: <Widget>[
                                            MaterialButton(
                                              child: Text('N??o'),
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                            ),
                                            MaterialButton(
                                              child: Text('Sim'),
                                              onPressed: () {
                                                new TreinosModel(model)
                                                    .concluiTreino(treino);
                                                Navigator.of(ctx).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 130,
                              width: 50,
                              color: Color(0xFF383838),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Grupo Muscular: " + treino.grupoMuscular,
                                      style:
                                          TextStyle(color: Color(0xFF979797)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Repeti????es: " +
                                          treino.repeticoes.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF979797),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "S??ries: " + treino.series.toString(),
                                      style: TextStyle(
                                        color: Color(0xFF979797),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  )));
        }));
  }
}
