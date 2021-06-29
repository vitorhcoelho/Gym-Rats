import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class TrainingForm extends StatefulWidget {
  @override
  _TreinoFormState createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TrainingForm> {
  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _grupoMuscularInputController = TextEditingController();
  TextEditingController _repeticoesInputController = TextEditingController();
  TextEditingController _seriesInputController = TextEditingController();
  TextEditingController _descansoInputController = TextEditingController();
  TextEditingController _diaInputController = TextEditingController();

  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

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

          return Scaffold(
            appBar: AppBar(
              title: Text('Cadastrar treino'),
              actions: <Widget>[
                IconButton(
                    onPressed: () async {
                      Map<String, dynamic> treino = {
                        "nome": _nomeInputController.text,
                        "grupoMuscular": _grupoMuscularInputController.text,
                        "repeticoes": _repeticoesInputController.text,
                        "series": _seriesInputController.text,
                        "descanso": _descansoInputController.text,
                        "dia": _diaInputController.text,
                      };
                      model.addTreinos(treino);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.save)),
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
                        controller: _nomeInputController,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Grupo Muscular'),
                        controller: _grupoMuscularInputController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Repeticoes'),
                        keyboardType: TextInputType.number,
                        controller: _repeticoesInputController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Series'),
                        keyboardType: TextInputType.number,
                        controller: _seriesInputController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Tempo de descanso em segundos'),
                        keyboardType: TextInputType.number,
                        controller: _descansoInputController,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Dia da semana'),
                        keyboardType: TextInputType.number,
                        controller: _diaInputController,
                      ),
                    ],
                  ),
                )),
          );
        }));
  }
}
