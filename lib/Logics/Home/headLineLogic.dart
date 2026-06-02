import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../Model/HeadLineNews.dart';

class NewsHeadLine {
  static bool isLoading = false;
  static bool hasMoreData = true;
  static int page = 1;
  static List<Articles> HeadLinesNews = [];
  static PageController pageController = PageController();

  static Future<HeadLineNews> getApi({int? pageOg}) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business';

    Uri urll = Uri.parse(url);

    urll = urll.replace(
      queryParameters: {
        ...urll.queryParameters,
        'pageSize': '10',
        'page': '$pageOg',
        'apiKey': '9e9a33afc0b4428696f4979866d96402',
      },
    );

    final responce = await http.get(urll);

    if (responce.statusCode == 200) {
      log("HeadLine Api Successfull");

      var data = jsonDecode(responce.body.toString());

      return HeadLineNews.fromJson(data);
    } else {
      throw Exception("Failed Api");
    }
  }

  static Future<void> FetchMoreData() async {
    if (isLoading || !hasMoreData) return;

    page++;
    await FetchHeadlineNews();
  }

  static Future<void> FetchHeadlineNews() async
  {
    if (isLoading) return;
    isLoading = true;
    try {
      HeadLineNews news = await getApi(pageOg: page);

      if (news.articles == null || news.articles!.isEmpty) {
        hasMoreData = false;
      } else {
        HeadLinesNews.addAll(news.articles!);
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
    isLoading = false;
  }


  static void Reset(){
    isLoading=false;
    hasMoreData=true;
    HeadLinesNews.clear();
    pageController.dispose();
  }

}
