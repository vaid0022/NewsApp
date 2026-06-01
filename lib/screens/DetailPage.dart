import 'package:flutter/material.dart';
import 'package:newsspp/widgets/Text.dart';
import '../Logics/Home/HomeLogic.dart';
import '../Logics/Home/headLineLogic.dart';

class Detail extends StatelessWidget {
  int index;
  bool isHeadline;
  Detail({ required this.index , required this.isHeadline });
  @override
  var latesNews = Homelogic.allnews;
 var Headline = NewsHeadLine.HeadLinesNews;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          isHeadline
                              ? Headline[index].urlToImage.toString() ?? ""
                              : latesNews[index].urlToImage.toString() ?? ""

                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    top: 450,

                    child: Container(
                      padding: EdgeInsetsGeometry.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextPadding(
                              padding: 20,
                              text:isHeadline
                                  ? Headline[index].title.toString()
                                  : latesNews[index].title.toString(),
                              isBold: true,
                              fontSize: 25,
                            ),

                            SizedBox(height: 20),
                            TextPadding(
                              padding: 20,
                              text: isHeadline
                                  ? Headline[index].description.toString()
                                  : latesNews[index].description.toString(),
                              isBold: false,
                              fontSize: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextPadding(
                                  padding: 10,
                                  text:
                                      "Author : ${isHeadline
                                          ? Headline[index].author.toString()
                                          : latesNews[index].author.toString()}",
                                  isBold: false,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextPadding(
                                padding: 10,
                                text:
                                    "Source: ${isHeadline
                                        ? Headline[index].source.toString()
                                        : latesNews[index].source?.name.toString()}",
                                isBold: false,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextPadding(
                                padding: 10,
                                text:
                                    "Publish At : ${isHeadline
                                        ? Headline[index].publishedAt.toString()
                                        : latesNews[index].publishedAt.toString()}",
                                isBold: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
