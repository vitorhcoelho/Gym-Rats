import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';

class TreinoTile extends StatelessWidget {
  final Treinos treino;

  const TreinoTile(this.treino);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(treino.nome),
      title: Text(treino.grupoMuscular),
      subtitle: Text(treino.repeticoes.toString()),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.amberAccent,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Excluir Treino'),
                          content:
                              Text('Tem certeza que deseja excluir o treino?'),
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
          ],
        ),
      ),
    );
  }
}
