import 'package:flutter/cupertino.dart';

class TextPadding extends StatelessWidget {
  double padding;
  String text;
  bool isBold;
  double? fontSize;
  Color? color;
  int? lines;
bool isLines;
  TextPadding({
    required this.padding,
    required this.text,
    required this.isBold,
    this.fontSize,
    this.color,
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
          color: color,
        ),
        maxLines: lines,
        overflow:isLines == true ? TextOverflow.ellipsis : null,
      ),
    );
  }
}
