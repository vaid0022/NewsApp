import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsspp/widgets/Text.dart';

import '../Logics/Catagory/spots.dart';

class CDetail extends StatelessWidget {
  CDetail({required this.index});
  int index;
  var news = Sports.allNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:
          Stack(
            clipBehavior: Clip.none,
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(news[index].imageUrl.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 450,
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(70)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        TextPadding(padding: 10, text: news[index].title.toString(), isBold: true),
                        TextPadding(padding: 10, text: news[index].description.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].content.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].category.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].aiSummary.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].country.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].creator.toString(), isBold: false),
                        TextPadding(padding: 10, text: news[index].language.toString(), isBold: false),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
