import 'package:flutter/material.dart';
import 'package:gym_rats/modules/login/components/buttonLogin.dart';
import 'package:gym_rats/modules/login/components/textField.dart';
import 'package:gym_rats/modules/login/components/textFieldPassword.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _hideCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF242424),
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
                        padding: EdgeInsets.only(top: 50.0),
                        child: ButtonLogin(
                          buttonText: "Entrar",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ButtonLogin(
                          buttonText: "Entrar com google",
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("Não possui uma conta? Criar aqui",
                              style: TextStyle(
                                color: Color(0xffffffff),
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
