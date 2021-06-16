import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_rats/modules/login/components/buttonLogin.dart';
import 'package:gym_rats/modules/login/components/textField.dart';
import 'package:gym_rats/modules/login/components/textFieldPassword.dart';
import 'package:gym_rats/modules/user/sign_up/sign_up_service.dart';
import 'package:http/http.dart' as http;

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF242424),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.10, 0, 0),
                    child: Image.asset(
                      'assets/Gym_rats_fonts.png',
                      height: MediaQuery.of(context).size.height * 0.20,
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: ComponentsTextField(
                            hintTextField: "Usuário",
                            iconTextField: Icons.person,
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          controller: _nameInputController,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: ComponentsTextField(
                            hintTextField: "E-mail",
                            iconTextField: Icons.mail,
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          controller: _mailInputController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          controller: _passwordInputController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          controller: _confirmInputController,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _doSignUp();
                        },
                        child: Text("Casdastrar"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Voltar",
                              style: TextStyle(
                                color: Color(0xFFDF9F17),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState.validate()) {
      SignUpService()
          .signUp(_mailInputController.text, _passwordInputController.text);
    } else {
      print("invalido");
    }
  }
}
