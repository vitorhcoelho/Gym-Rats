import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return CustomRadioButton(
      spacing: 2,
      height: 70,
      autoWidth: true,
      unSelectedColor: Color(0xFF2F2F2F),
      unSelectedBorderColor: Color(0xFF2F2F2F),
      selectedBorderColor: Color(0xFFDF9F17),
      selectedColor: Color(0xFFDF9F17),
      horizontal: true,
      buttonLables: [],
      buttonValues: [],
      buttonTextStyle: ButtonTextStyle(
          selectedColor: Colors.black,
          unSelectedColor: Colors.white,
          textStyle: TextStyle(fontSize: 16)),
      radioButtonValue: (value) {
        print(value);
      },
    );
  }
}
