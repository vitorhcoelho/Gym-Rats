import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Training extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: doSomething,
      child: SizedBox(
        height: 50,
        width: 100,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFDF9F17),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF121212).withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text('Supino Inclinado',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ),
    );
  }
}
