import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsspp/widgets/Text.dart';

import '../Logics/Catagory/CatagoriesLogic.dart';

class CDetail extends StatelessWidget {
  CDetail({required this.index});
  int index;
  var news = CatagoriesLogic.allNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
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
                height: 540,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextPadding(
                          padding: 10,
                          text: news[index].title.toString(),
                          fontSize: 24,
                          isBold: true,

                          isLines: false,
                        ),
                        SizedBox(height: 20),
                        TextPadding(
                          padding: 10,
                          fontSize: 18,
                          text: news[index].description.toString(),
                          isBold: false,
                          isLines: false,
                        ),
                        TextPadding(
                          padding: 10,
                          fontSize: 18,
                          text: "News Catagory: ${news[index].category}",
                          isBold: false,
                          isLines: false,
                        ),

                        TextPadding(
                          padding: 10,
                          fontSize: 18,
                          text: "Country: ${news[index].country}",
                          isBold: false,
                          isLines: false,
                        ),
                        TextPadding(
                          padding: 10,
                          fontSize: 18,
                          text: "Author: ${news[index].creator}",
                          isBold: false,
                          isLines: false,
                        ),
                        TextPadding(
                          padding: 10,
                          fontSize: 18,
                          text: "Language: ${news[index].language}",
                          isBold: false,
                          isLines: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
