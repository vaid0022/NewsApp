import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomWidget{
  static Widget choiceChip({required String value,required ValueChanged<bool> valueChanged,required var selected}){
    return     ChoiceChip(
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadiusGeometry.circular(20)
     ),side: BorderSide(color: Colors.lightBlueAccent),
      elevation: 2,
      pressElevation: 8,
      showCheckmark: false,
      label: Text(value),
      selected: selected == value,
      selectedColor: Colors.lightBlueAccent,
      onSelected: valueChanged
    );
  }
}