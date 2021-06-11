import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  final String buttonText;

  ButtonLogin({
    @required this.buttonText,
  });

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  String _buttonText;

  @override
  void initState() {
    super.initState();
    _buttonText = widget.buttonText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          child: Container(
            height: 40.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              padding: EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Ink(
                color: Color(0xFFDF9F17),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                      minHeight: 33.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          _buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
