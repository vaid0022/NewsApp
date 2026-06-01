import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomWidget{
  static Widget choiceChip({required String value,required ValueChanged<bool> valueChanged,required var selected}){
    return     ChoiceChip(
      label: Text(value),
      selected: selected == value,
      selectedColor: Colors.lightBlueAccent,
      onSelected: valueChanged
    );
  }
}