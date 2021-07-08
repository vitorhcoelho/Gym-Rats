import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class TreinoTile extends StatelessWidget {
  final Treinos treino;

  const TreinoTile(this.treino);

  @override
  Widget build(BuildContext context) {
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
                                treino.dia.toString().capitalize(),
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
                              icon: Icon(Icons.delete),
                              color: Colors.white,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text('Excluir Treino'),
                                    content: Text(
                                        'Tem certeza que deseja excluir o treino?'),
                                    actions: <Widget>[
                                      MaterialButton(
                                        child: Text('Não'),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                      ),
                                      MaterialButton(
                                        child: Text('Sim'),
                                        onPressed: () {
                                          // Provider.of<Treinos>(context, listen: false)
                                          //     .remove(treino);
                                          // Navigator.of(ctx).pop();
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
                        height: 180,
                        width: 50,
                        color: Color(0xFF383838),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Grupo Muscular: " + treino.grupoMuscular,
                                style: TextStyle(color: Color(0xFF979797)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Nome do treino: " + treino.nome,
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Repetições: " + treino.repeticoes.toString(),
                                style: TextStyle(
                                  color: Color(0xFF979797),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Séries: " + treino.series.toString(),
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
  }
}
