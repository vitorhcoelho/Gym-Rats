import 'package:flutter/material.dart';
import 'package:gym_rats/models/evolucaoModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class MetaForm extends StatefulWidget {
  @override
  _MetaFormState createState() => _MetaFormState();
}

class _MetaFormState extends State<MetaForm> {
  TextEditingController _metaInputController = TextEditingController();

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
            backgroundColor: Color(0xFF242424),
            appBar: AppBar(
              title: Text('Cadastrar uma meta'),
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
                            labelText: "Escolha uma meta de peso",
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: Color(0xFFEFB029),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _metaInputController),
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
                            model.addMeta(_metaInputController.text);
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                )),
          );
        }));
  }
}
