import 'package:flutter/material.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/sign_up/view/sign_up_page.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  final String hintTextField;
  final IconData iconTextField;

  LoginPage({
    @required this.hintTextField,
    @required this.iconTextField,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 40)),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.10,
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xFF979797)),
                                decoration: InputDecoration(
                                  focusColor: Color(0xFF979797),
                                  labelStyle:
                                      TextStyle(color: Color(0xFF979797)),
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
                                    color: Color(0xFFEFB029),
                                  ),
                                  //suffixIcon: Icon();
                                ),
                                controller: _mailInputController,
                                validator: (value) {
                                  if (!value.contains("@") ||
                                      (!value.contains(".com"))) {
                                    return "E-mail invalido";
                                  } else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.10),
                                child: TextField(
                                  style: TextStyle(color: Color(0xFF979797)),
                                  obscureText: _hidePassword,
                                  decoration: InputDecoration(
                                    focusColor: Color(0xFF979797),
                                    labelStyle:
                                        TextStyle(color: Color(0xFF979797)),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                model.signIn(
                                    email: _mailInputController.text,
                                    pass: _passwordInputController.text,
                                    onSuccess: _onSuccess,
                                    onFail: _onFail);
                              }
                            },
                            child: Text("Entrar"),
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
                                    builder: (context) => SigninPage()),
                              );
                            },
                            child: Text("Não possui uma conta? Criar aqui",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSuccess() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pushNamed('/home');
    });
  }

  void _onFail() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Email ou senha incorreta!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
