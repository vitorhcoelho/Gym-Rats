import 'package:flutter/material.dart';
import 'package:gym_rats/models/evolucaoModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class EvolucaoForm extends StatefulWidget {
  @override
  _EvolucaoFormState createState() => _EvolucaoFormState();
}

class _EvolucaoFormState extends State<EvolucaoForm> {
  TextEditingController _dataInputController = TextEditingController();
  TextEditingController _pesoInputController = TextEditingController();
  TextEditingController _descricaoInputController = TextEditingController();

  final _form = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EvolucaoModel>(
        model: EvolucaoModel(Usuario.of(context).firebaseUser),
        child: ScopedModelDescendant<EvolucaoModel>(
            builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Cadastrar Evolução'),
              actions: <Widget>[
                IconButton(
                    onPressed: () async {
                      Map<String, dynamic> evolucao = {
                        "data": _dataInputController.text,
                        "peso": _pesoInputController.text,
                        "descricao": _descricaoInputController.text
                      };
                      model.addEvolucao(evolucao);
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
                          decoration: InputDecoration(labelText: 'Data'),
                          controller: _dataInputController),
                      TextFormField(
                          decoration: InputDecoration(labelText: 'Peso'),
                          keyboardType: TextInputType.number,
                          controller: _pesoInputController),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Comentário sobre o período'),
                          controller: _descricaoInputController),
                    ],
                  ),
                )),
          );
        }));
  }
}
