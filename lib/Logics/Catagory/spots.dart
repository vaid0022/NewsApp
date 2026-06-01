import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:newsspp/Model/SportsModel.dart';
import 'package:newsspp/screens/Catagories.dart';
import 'package:http/http.dart' as http;
import 'package:newsspp/screens/news.dart';

class Sports {
  static List<Results> allNews = [];
  static ScrollController scrollController =ScrollController();
  static bool isLoading = false;
  static bool hasMoreData = true;
  static String? nextpage;
  static String? catagory;

  static Future<SportsModel> GetApi()
  async{
    String url = "https://newsdata.io/api/1/latest?";

    Uri urll =  Uri.parse(url);


   Map<String,String> queryParam = {
       'q': catagory ?? 'sports',
        'apiKey' : 'pub_23279a10ba944f918603eb07e7b85ac5',
    };
      if(nextpage != null && nextpage!.isNotEmpty){
        queryParam['page'] = nextpage!;
    }

      urll = urll.replace(queryParameters: queryParam);


    final responce = await http.get(urll);

    if(responce.statusCode == 200)
      {
        log("Sports Api Succesfull");
       try
           {
             final data = jsonDecode(responce.body.toString());
              nextpage = data["nextPage"];

              if(nextpage == null || nextpage!.isEmpty){
                hasMoreData =false;
              }
             return SportsModel.fromJson(data);
           }catch (e){
            throw Exception("Error: $e");
       }
      }else{

      throw Exception("Api failed");
    }
  }


  static Future<void> FetchData()async
  {
      if(isLoading) return;

      isLoading =true;

      try{
        SportsModel news =await GetApi();

        if(news.results == null || news.results!.isEmpty){
          hasMoreData =false;

        }else{
          allNews.addAll(news.results!);
        }
      }catch(e){
        throw Exception(e);
      }finally{
        isLoading = false;
  }
  }

  static Future<void> HasMoreData()async{
    if(isLoading || !hasMoreData)return;

    await FetchData();
  }
  static void pagination({required VoidCallback  refreshUI}){
        scrollController.addListener((){
          if
          (scrollController.position.pixels >= scrollController.position.maxScrollExtent -100){
            FetchData().then((_){
              refreshUI();
            });
          }
        });
  }
  static void reset(){
    nextpage =null;
    allNews.clear();
    isLoading=false;
    hasMoreData=true;
  }

  static void StoreCatagory({ required String? SelectedCatagory}) {
        catagory = SelectedCatagory!.toLowerCase();
  }
}