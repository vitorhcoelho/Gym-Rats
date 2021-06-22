import 'package:flutter/material.dart';

class ButtonLoginGoogle extends StatefulWidget {
  final String buttonText;

  ButtonLoginGoogle({
    @required this.buttonText,
  });

  @override
  _ButtonLoginGoogleState createState() => _ButtonLoginGoogleState();
}

class _ButtonLoginGoogleState extends State<ButtonLoginGoogle> {
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
            // ignore: deprecated_member_use
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
              child: Ink(
                color: Color(0xFFB53A3A),
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
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
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
