import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/providers/trainings.dart';
import 'package:provider/provider.dart';

class Training_form extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar treino'),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                _form.currentState.save();
                await Provider.of<Trainings>(context, listen: false).put(
                  Treino(
                    idTreino: _formData['idTreino'],
                    nome: _formData['nome'],
                    grupoMuscular: _formData['grupoMuscular'],
                    repeticoes: _formData['repeticoes'],
                    series: _formData['series'],
                    descanso: _formData['descanso'],
                  ),
                );
                Navigator.of(context).pop();
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
                    onSaved: (value) => _formData['series'] = int.parse(value)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Tempo de descanso em segundos'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _formData['descanso'] = int.parse(value),
                ),
              ],
            ),
          )),
    );
  }
}
