import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsspp/Model/HeadLineNews.dart';
import 'package:newsspp/screens/DetailPage.dart';
import 'package:newsspp/widgets/shimmerWidget.dart';
import '../Logics/Home/HomeLogic.dart';
import '../Logics/Home/headLineLogic.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState() {
    super.initState();
    Homeinit();
    NewsHeadLine.FetchHeadlineNews().then((value) {
      setState(() {});
    });  }

  void Homeinit() {
    Homelogic.FetchApi().then((value) {
      setState(() {});
    });

    Homelogic.scrollController.addListener(() {
      if (Homelogic.scrollController.position.pixels >=
          Homelogic.scrollController.position.maxScrollExtent - 200) {
        Homelogic.FetchingMoreData().then((value) {
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
                child: Text("News HeadLines:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                )
            ),
            NewsHeadLine.HeadLinesNews.isEmpty && NewsHeadLine.isLoading
                ? headLineshimmer()
                : Container(
                    height: 350,
                    width: double.infinity,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: NewsHeadLine.pageController,
                      onPageChanged: (index){
                        if(index >= NewsHeadLine.HeadLinesNews.length -3){
                          NewsHeadLine.FetchMoreData();
                        }
                      },
                      itemCount: NewsHeadLine.isLoading
                          ? NewsHeadLine.HeadLinesNews.length + 1
                          : NewsHeadLine.HeadLinesNews.length,
                      itemBuilder: (context, HoriIndex) {
                        if(HoriIndex == NewsHeadLine.HeadLinesNews.length){
                          return Center(child: CircularProgressIndicator(),);
                        }if(NewsHeadLine.HeadLinesNews.isEmpty || NewsHeadLine.HeadLinesNews == null){
                          return Center(child: Text("Data is not Available"),);
                        }
                        return headlineContent(index: HoriIndex);
                      },
                    ),
                  ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Latest News:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            Expanded(
              child: Homelogic.allnews.isEmpty && Homelogic.isLoading
                  ? Shimmerwidget()
                  : Container(
                      child: ListView.builder(
                        controller: Homelogic.scrollController,
                        itemCount: Homelogic.isLoading
                            ? Homelogic.allnews.length + 1
                            : Homelogic.allnews.length,
                        itemBuilder: (context, index) {
                          if (index == Homelogic.allnews.length) {
                            return Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return LatedNewsContent(index: index);
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),

    );
  }
}

class headlineContent extends StatelessWidget {
  @override
  int index;
  headlineContent({required this.index});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(index: index, isHeadline: true)));
      },
      child: Stack(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  NewsHeadLine.HeadLinesNews[index].urlToImage.toString() ?? "",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            child: Text(
              NewsHeadLine.HeadLinesNews[index].title.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 80,
            child: Text(
              NewsHeadLine.HeadLinesNews[index].description ??
                  'No Descriptioin Available',
              style: TextStyle(color: Colors.white),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class LatedNewsContent extends StatelessWidget {
  int index;

  LatedNewsContent({required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(index: index,isHeadline: false,)));
      },
      child: Card(
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    Homelogic.allnews[index].urlToImage.toString() ?? "",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      Homelogic.allnews[index].title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      Homelogic.allnews[index].description.toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
