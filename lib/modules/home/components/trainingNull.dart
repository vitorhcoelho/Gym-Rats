import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrainingNull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF272727),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF121212).withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                "Nada de treinos por hoje...",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
