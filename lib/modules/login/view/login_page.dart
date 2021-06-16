import 'package:flutter/material.dart';
import 'package:gym_rats/modules/login/components/buttonLoginGoogle.dart';
import 'package:gym_rats/modules/login/components/textField.dart';
import 'package:gym_rats/modules/login/components/textFieldPassword.dart';
import 'package:gym_rats/modules/login/view/login_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

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
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 40)),
                      ComponentsTextField(
                        hintTextField: "E-mail",
                        iconTextField: Icons.person,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'E-mail',
                            icon: Icon(Icons.person, color: Colors.yellow),
                          ),
                          controller: _mailInputController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: TextFieldPassWordLogin(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: TextFormField(
                          controller: _passwordInputController,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _doLogin();
                        },
                        child: Text("Entrar"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: ButtonLoginGoogle(
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

  void _doLogin() {
    if (_formKey.currentState.validate()) {
      LoginService()
          .login(_mailInputController.text, _passwordInputController.text);
    } else {
      print("invalido");
    }
  }
}
