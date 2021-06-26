import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class TrainingForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TreinosModel>(
        builder: (context, child, model) {
      if (model.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );

      return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar treino'),
          actions: <Widget>[
            IconButton(
                onPressed: () async {
                  Treinos treinos = Treinos();
                  treinos.descanso = _formData['descanso'];
                  treinos.nome = _formData['nome'];
                  treinos.grupoMuscular = _formData['grupoMuscular'];
                  treinos.repeticoes = _formData['repeticoes'];
                  treinos.series = _formData['series'];
                  model.addTreinos(treinos);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Exercício'),
                    onSaved: (value) => _formData['nome'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Grupo Muscular'),
                    onSaved: (value) => _formData['grupoMuscular'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Repeticoes'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) =>
                        _formData['repeticoes'] = int.parse(value),
                  ),
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Series'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) =>
                          _formData['series'] = int.parse(value)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Tempo de descanso em segundos'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) =>
                        _formData['descanso'] = int.parse(value),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
