import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxTraining extends StatefulWidget {
  const BoxTraining({Key key}) : super(key: key);

  @override
  _BoxTrainingState createState() => _BoxTrainingState();
}

class _BoxTrainingState extends State<BoxTraining> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Container(
          height: 200,
          width: 50,
          alignment: Alignment.center,
          color: Color(0xFF242424),
          child: ListView(
            children: [
              Container(
                color: Colors.orange,
                height: 35,
                width: 50,
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: Color(0xFF383838),
                height: 140,
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
