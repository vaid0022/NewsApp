import 'package:flutter/material.dart';
import 'package:newsspp/Logics/NewsDetail/detailNews.dart';

class detailnews extends StatefulWidget {
  const detailnews({super.key});

  @override
  State<detailnews> createState() => _detailnewsState();
}

class _detailnewsState extends State<detailnews> {
  void initState() {
    super.initState();

    detailNewsLogice.Reset();

    detailNewsLogice.FetchData().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
    detailNewsLogice.setpagination(
      RefreshUI: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }
  void dispoce()
  {
    detailNewsLogice.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail News")),
      body: detailNewsLogice.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: detailNewsLogice.scrollController,
              itemCount:
                  detailNewsLogice.allNews.length + (detailNewsLogice.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == detailNewsLogice.allNews.length) {
                  return Center(child: CircularProgressIndicator());
                }
                return NewsUI(index: index);
              },
            ),
    );
  }
}

class NewsUI extends StatelessWidget {
  NewsUI({required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        detailNewsLogice.openVideo(Enter_url: detailNewsLogice.allNews[index].link.toString());
      },
      child: Column(
        children: [
          SizedBox(height: 20,),
          Card(
            elevation: 5,
            child: Stack(
              children: [
                Text(detailNewsLogice.allNews[index].title.toString()),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        detailNewsLogice.allNews[index].imageUrl ??
                            "https://boingboing.net/wp-content/uploads/2026/05/shutterstock_2571063915.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top:1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      detailNewsLogice.allNews[index].title ?? "NO Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      detailNewsLogice.allNews[index].description ?? "No Description",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
