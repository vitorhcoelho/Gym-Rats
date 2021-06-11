import 'package:flutter/material.dart';
import 'package:gym_rats/modules/login/components/buttonLogin.dart';
import 'package:gym_rats/modules/login/components/textField.dart';
import 'package:gym_rats/modules/login/components/textFieldPassword.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';

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
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.10, 0, 0),
                    child: Image.asset(
                      'assets/Gym_rats_fonts.png',
                      height: MediaQuery.of(context).size.height * 0.20,
                    )),
                Container(
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
                          child: ComponentsTextField(
                            hintTextField: "E-mail",
                            iconTextField: Icons.mail,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: ButtonLogin(
                          buttonText: "Entrar",
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
}
