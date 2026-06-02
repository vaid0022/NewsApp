
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:newsspp/Model/VideoModel.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class detailNewsLogice {

  static bool isLoading = false;
  static bool isHasMoreData= true;
  static List<Results> allNews=[];
  static ScrollController scrollController =ScrollController();
  static String? nextPage;

  static Future<VideoModel> getApi()async{

    String url = "https://newsdata.io/api/1/latest?apikey=pub_23279a10ba944f918603eb07e7b85ac5&q=youtube%20video";

    Uri urll = Uri.parse(url);

    Map<String,String> queryParam = {
      'apiKey' : 'pub_23279a10ba944f918603eb07e7b85ac5'
    };
    if(nextPage != null && nextPage!.isNotEmpty){
      queryParam['page'] = nextPage!;
    }

    urll =urll.replace(
      queryParameters: queryParam
    );

    var Responce = await http.get(urll);

    if(Responce.statusCode == 200) {
      log("Video Api Connected Succssfully");

      try {

        var data = jsonDecode(Responce.body.toString());
        nextPage = data['nextPage'];

        if(nextPage == null || nextPage!.isEmpty)
          {
            isHasMoreData = false;
          }

        return VideoModel.fromJson(data);
      } catch (e) {

        throw Exception(e.toString());

      }
    }else{

      throw Exception("Video Api Failed");
    }
  }

 static Future<void> FetchData()async{

    if(isLoading || !isHasMoreData)return;

    isLoading =true;

    try{
      VideoModel news = await getApi();

      if(news.results == null || news.results!.isEmpty){

        isHasMoreData =false;

      }else{

        allNews.addAll(news.results!);

      }
    }catch(e){

      throw Exception("Error: $e");
    }finally{
      isLoading = false;
    }
  }

  static  Future<void> HasMoresData()async{

    if(isLoading)return;

    await FetchData();

  }

static void setpagination({required VoidCallback RefreshUI}){

    scrollController.addListener(()async{
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200){
      await  FetchData().then((_){
          RefreshUI();
        });
      }
    });

}

static void Reset(){
    isLoading = false;
    isHasMoreData =true;
    allNews.clear();
    nextPage =null;

    if(scrollController.hasClients){
      scrollController.dispose();
    }
    scrollController = ScrollController();
}


static Future<void> openVideo({required String Enter_url})async{

    Uri url = Uri.parse(Enter_url);

   bool launched =await launchUrl(url,mode: LaunchMode.platformDefault);
   print("$launched");
}
}