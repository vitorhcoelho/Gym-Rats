import 'package:flutter/material.dart';
import 'package:gym_rats/components/components_textField.dart';
import 'package:gym_rats/modules/login/components/buttonLogin.dart';
import 'package:gym_rats/modules/login/components/textFieldPassword.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hideCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.15,
                              0,
                              40)),
                      ComponentsTextField(
                        hintTextField: "E-mail",
                        iconTextField: Icons.person,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                        child: Row(children: <Widget>[
                          Checkbox(
                              activeColor: Color(0xffff7700),
                              value: _hideCheckbox,
                              onChanged: (bool newValue) {
                                setState(() {
                                  _hideCheckbox = newValue;
                                });
                              }),
                          Text("Lembrar de mim",
                              style: TextStyle(
                                color: Colors.black54,
                              )),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ButtonLogin(
                          buttonText: "ENTRAR",
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: FlatButton(
                            child: Text("esqueceu a senha?",
                                style: TextStyle(
                                  color: Colors.black54,
                                )),
                            onPressed: () {},
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: FlatButton(
                          child: Text("CADASTRAR",
                              style: TextStyle(
                                color: Color(0xffff7700),
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
}
