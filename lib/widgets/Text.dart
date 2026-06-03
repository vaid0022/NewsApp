import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsspp/Providers/Provider.dart';
import 'package:provider/provider.dart';

class TextPadding extends StatelessWidget {
  double padding;
  String text;
  bool isBold;
  double? fontSize;
  int? lines;
bool isLines;
  TextPadding({
    required this.padding,
    required this.text,
    required this.isBold,
    this.fontSize,
    this.lines,
    required this.isLines
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(padding),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight(1),
          fontSize: fontSize,
           color:  Colors.black
        ),
        maxLines: lines,
        overflow:isLines == true ? TextOverflow.ellipsis : null,
      ),
    );
  }
}
