import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';

class TreinoTile extends StatelessWidget {
  final Treinos treino;

  const TreinoTile(this.treino);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 80,
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
          child: ListTile(
            leading: Text(
              treino.grupoMuscular,
              style: TextStyle(color: Color(0xFF979797)),
            ),
            title: Text(
              treino.nome,
              style: TextStyle(
                color: Color(0xFF979797),
              ),
            ),
            subtitle: Text(
              treino.repeticoes.toString(),
              style: TextStyle(
                color: Color(0xFF979797),
              ),
            ),
            trailing: Container(
              width: 50,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Color(0xFFDF9F17),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
