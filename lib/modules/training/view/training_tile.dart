import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';

class TreinoTile extends StatelessWidget {
  final Treinos treino;

  const TreinoTile(this.treino);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: Color(0xFF242424),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Container(
            height: 140,
            width: 50,
            alignment: Alignment.center,
            color: Color(0xFF242424),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: Color(0xFFDF9F17),
                  height: 35,
                  width: 50,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
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
                                ));
                      },
                    ),
                  ),
                ),
                Container(
                  color: Color(0xFF383838),
                  height: 140,
                  width: 50,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Grupo Muscular: " + treino.grupoMuscular,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Nome do treino: " + treino.nome,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Repetições: " + treino.repeticoes.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Repetições: " +
                                          treino.repeticoes.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
