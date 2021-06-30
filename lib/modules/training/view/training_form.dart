import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class TrainingForm extends StatefulWidget {
  @override
  _TreinoFormState createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TrainingForm> {
  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _repeticoesInputController = TextEditingController();
  TextEditingController _seriesInputController = TextEditingController();
  TextEditingController _descansoInputController = TextEditingController();
  String grupoMuscular;
  String diaSemana;

  final _form = GlobalKey<FormState>();
  // ignore: unused_field
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
            backgroundColor: Color(0xFF242424),
            appBar: AppBar(
              title: Text('Cadastrar treino'),
              flexibleSpace: Container(
                decoration: BoxDecoration(color: Color(0xFFDF9F17)),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Color(0xFF979797)),
                      decoration: InputDecoration(
                        focusColor: Color(0xFF979797),
                        labelStyle: TextStyle(color: Color(0xFF979797)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        labelText: "Exercício",
                        prefixIcon: Icon(
                          Icons.fitness_center,
                          color: Color(0xFFEFB029),
                        ),
                      ),
                      DropdownButton<String>(
                        value: grupoMuscular,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            grupoMuscular = newValue;
                          });
                        },
                        items: model.gruposMuscularesLista
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      controller: _grupoMuscularInputController,
                    ),
                    TextFormField(
                      style: TextStyle(color: Color(0xFF979797)),
                      decoration: InputDecoration(
                        focusColor: Color(0xFF979797),
                        labelStyle: TextStyle(color: Color(0xFF979797)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        labelText: "Repetições",
                        prefixIcon: Icon(
                          Icons.repeat,
                          color: Color(0xFFEFB029),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _repeticoesInputController,
                    ),
                    TextFormField(
                      style: TextStyle(color: Color(0xFF979797)),
                      decoration: InputDecoration(
                        focusColor: Color(0xFF979797),
                        labelStyle: TextStyle(color: Color(0xFF979797)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        labelText: "Séries",
                        prefixIcon: Icon(
                          Icons.grading_outlined,
                          color: Color(0xFFEFB029),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _seriesInputController,
                    ),
                    TextFormField(
                      style: TextStyle(color: Color(0xFF979797)),
                      decoration: InputDecoration(
                        focusColor: Color(0xFF979797),
                        labelStyle: TextStyle(color: Color(0xFF979797)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF979797),
                        )),
                        labelText: "Tempo de descanso (em segundos)",
                        prefixIcon: Icon(
                          Icons.access_time,
                          color: Color(0xFFEFB029),
                        ),
                      ),
                      DropdownButton<String>(
                        value: diaSemana,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            diaSemana = newValue;
                          });
                        },
                        items: model.diasSemana
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _diaInputController,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: 440,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: Text(
                          "Salvar",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        textColor: Colors.white,
                        color: Color(0xFFDF9F17),
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
                          Navigator.of(context).pushNamed('/newtraining');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
