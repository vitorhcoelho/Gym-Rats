import 'package:flutter/material.dart';
import 'package:gym_rats/modules/user/sign_up/sign_up_service.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();
  bool _hidePassword = true;
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10,
                          ),
                          child: TextFormField(
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
                              labelText: "Usuário",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFFDF9F17),
                              ),
                              //suffixIcon: Icon();
                            ),
                            controller: _nameInputController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10,
                          ),
                          child: TextFormField(
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
                              labelText: "E-mail",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFFDF9F17),
                              ),
                              //suffixIcon: Icon();
                            ),
                            controller: _mailInputController,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF979797)),
                          obscureText: _hidePassword,
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
                            labelText: "Senha",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFFEFB029),
                            ),
                            suffixIcon: IconButton(
                              icon: _hidePassword
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Color(0xFF979797),
                                    )
                                  : Icon(Icons.visibility,
                                      color: Color(0xFF979797)),
                              onPressed: () {
                                _hidePassword = !_hidePassword;
                                setState(() {});
                              },
                            ),
                            //suffixIcon: Icon();
                          ),
                          controller: _passwordInputController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10),
                        child: TextField(
                          style: TextStyle(color: Color(0xFF979797)),
                          obscureText: _hidePassword,
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
                            labelText: "Senha",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFFEFB029),
                            ),
                            suffixIcon: IconButton(
                              icon: _hidePassword
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Color(0xFF979797),
                                    )
                                  : Icon(Icons.visibility,
                                      color: Color(0xFF979797)),
                              onPressed: () {
                                _hidePassword = !_hidePassword;
                                setState(() {});
                              },
                            ),
                            //suffixIcon: Icon();
                          ),
                          controller: _confirmInputController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            _doSignUp();
                          },
                          child: Text("Casdastrar"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        // ignore: deprecated_member_use
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
      SignUpService().signUp(
          _mailInputController.text, _passwordInputController.text, context);
    } else {
      print("invalido");
    }
  }
}
