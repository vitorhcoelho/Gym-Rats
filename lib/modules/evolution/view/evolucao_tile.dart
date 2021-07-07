import 'package:flutter/material.dart';
import 'package:gym_rats/models/evolucao.dart';

class EvolucaoTile extends StatelessWidget {
  final Evolucao evolucao;

  const EvolucaoTile(this.evolucao);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(evolucao.data),
      title: Text(evolucao.descricao),
      subtitle: Text(evolucao.peso.toString()),
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
                          title: Text('Excluir Evolução'),
                          content: Text(
                              'Tem certeza que deseja excluir a evolução?'),
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
