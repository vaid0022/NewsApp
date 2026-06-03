  import 'dart:convert';
  import 'dart:math';

  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'package:newsspp/Model/NewsModel.dart';
  import 'package:newsspp/main.dart';
  import 'package:newsspp/screens/HomePage.dart';

  class Homelogic {
    static int page = 1;
    static bool isLoading = false;
    static bool hasMoreData = true;
    static ScrollController scrollController = ScrollController();
    static List<Articles> allnews = [];

    static Future<NewsModel> getApi({int? pageo}) async {
      final url =
          'https://newsapi.org/v2/everything?q=apple&from=2026-05-27&to=2026-05-27&sortBy=popularity';

      var urll = Uri.parse(url);

      urll = urll.replace(
        queryParameters: {
          ...urll.queryParameters,

          'page': '$pageo',
          'pageSize': '10',
          'apiKey': '9e9a33afc0b4428696f4979866d96402',
        },
      );
      final responce = await http.get(urll);

      if (responce.statusCode == 200) {
        print("API SUCCESSFULL");

        try {
          final data = jsonDecode(responce.body);

          return NewsModel.fromJson(data);
        } catch (error) {
          throw Exception(error.toString());
        }
      } else {
        throw Exception("API FAILED");
      }
    }

    //Fetching Api
    static Future<void> FetchApi() async {
      if (isLoading) return;

      isLoading = true;

      try {
        NewsModel news = await getApi(pageo: page);

        if (news.articles == null || news.articles!.isEmpty) {
          hasMoreData = true;
        } else {
          allnews.addAll(news.articles!);
        }
      } catch (error) {
        print(error.toString());
      }
      isLoading = false;
    }

    //For Fetching More Data

    static Future<void> FetchingMoreData() async {
      if (isLoading || !hasMoreData) {
        page++;

        await FetchApi();
      }
    }

    //Clean Memory
    static void Despose() {
      scrollController.dispose();
    }

    static void setUpPagination({required VoidCallback RefreshUi}) {
     Homelogic.scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
           FetchingMoreData().then((value) {
            RefreshUi();
          });
        }
      });
    }

    static void Reset(){
      isLoading=false;
      hasMoreData=true;
      allnews.clear();
    }
  }
