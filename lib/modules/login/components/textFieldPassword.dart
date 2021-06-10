import 'package:flutter/material.dart';

class TextFieldPassWordLogin extends StatefulWidget {
  @override
  _TextFieldPassWordLoginState createState() => _TextFieldPassWordLoginState();
}

class _TextFieldPassWordLoginState extends State<TextFieldPassWordLogin> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.10),
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
                      : Icon(Icons.visibility, color: Color(0xFF979797)),
                  onPressed: () {
                    _hidePassword = !_hidePassword;
                    setState(() {});
                  },
                ),
                //suffixIcon: Icon();
              )),
        ),
      ),
    );
  }
}
