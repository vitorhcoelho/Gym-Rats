import 'package:flutter/material.dart';

class ComponentsTextField extends StatefulWidget {
  final String hintTextField;
  final IconData iconTextField;

  ComponentsTextField({
    @required this.hintTextField,
    @required this.iconTextField,
  });

  @override
  _ComponentsTextFieldState createState() => _ComponentsTextFieldState();
}

class _ComponentsTextFieldState extends State<ComponentsTextField> {
  String _hintTextField;
  IconData _iconTextField;

  @override
  void initState() {
    super.initState();
    _hintTextField = widget.hintTextField;
    _iconTextField = widget.iconTextField;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.10,
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
              labelText: _hintTextField,
              prefixIcon: Icon(
                _iconTextField,
                color: Color(0xFFDF9F17),
              ),
              //suffixIcon: Icon();
            ),
          ),
        ),
      ),
    );
  }
}
