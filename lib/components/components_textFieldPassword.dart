import 'package:flutter/material.dart';

class ComponentsTextFieldPassword extends StatefulWidget {
  @override
  _ComponentsTextFieldPasswordState createState() =>
      _ComponentsTextFieldPasswordState();
}

class _ComponentsTextFieldPasswordState
    extends State<ComponentsTextFieldPassword> {
  TextEditingController _controller = TextEditingController();

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.10),
          child: TextField(
              style: TextStyle(color: Colors.black54),
              obscureText: _hidePassword,
              controller: _controller,
              decoration: InputDecoration(
                focusColor: Color(0xffff7700),
                labelStyle: TextStyle(color: Color(0xffff7700)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xffff7700),
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xffff7700),
                )),
                labelText: "Senha",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xffff7700),
                ),
                suffixIcon: IconButton(
                  icon: _hidePassword
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.black26,
                        )
                      : Icon(Icons.visibility, color: Color(0xffff7700)),
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
