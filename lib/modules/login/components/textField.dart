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
    // TODO: implement initState
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
            style: TextStyle(color: Colors.black54),
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
              labelText: _hintTextField,
              prefixIcon: Icon(
                _iconTextField,
                color: Color(0xffff7700),
              ),
              //suffixIcon: Icon();
            ),
          ),
        ),
      ),
    );
  }
}
