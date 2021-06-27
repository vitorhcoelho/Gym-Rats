import 'package:flutter/material.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/login/view/login_page.dart';
import 'package:scoped_model/scoped_model.dart';

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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              ScopedModelDescendant<Usuario>(
                builder: (context, child, model) {
                  if (model.isLoading)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return Form(
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
                              if (_formKey.currentState.validate()) {
                                Map<String, dynamic> userData = {
                                  "name": _nameInputController.text,
                                  "email": _mailInputController.text,
                                };

                                model.signUp(
                                    userData: userData,
                                    pass: _passwordInputController.text,
                                    onSuccess: _onSuccess,
                                    onFail: _onFail);
                              }
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage(
                                            hintTextField: '',
                                            iconTextField: null,
                                          )));
                            },
                            child: Text("Voltar",
                                style: TextStyle(
                                  color: Color(0xFFDF9F17),
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  void _onSuccess() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
