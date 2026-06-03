import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsspp/Providers/Provider.dart';
import 'package:provider/provider.dart';

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

  static Widget TextPadding({
    required double padding,
    required String text,
    required bool isBold,
    double? fontSize,
    int? lines,
    required bool isLines,
  }){
    return Padding(
        padding: EdgeInsetsGeometry.all(padding),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight(1),
              fontSize: fontSize,
          ),
          maxLines: lines,
          overflow:isLines == true ? TextOverflow.ellipsis : null,
        ));
        }
}