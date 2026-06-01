import 'package:flutter/material.dart';
import 'package:newsspp/Model/SportsModel.dart';
import 'package:newsspp/screens/CatagoriesDetail.dart';
import 'package:newsspp/screens/HomePage.dart';
import 'package:newsspp/screens/news.dart';
import 'package:newsspp/widgets/shimmerWidget.dart';
import 'package:newsspp/widgets/widget.dart';

import '../Logics/Catagory/spots.dart';

class Catagories extends StatefulWidget {
  const Catagories({super.key});

  @override
  State<Catagories> createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  @override
  void initState() {
    super.initState();
    SelectedCatagory = "India";
    Sports.StoreCatagory(SelectedCatagory:SelectedCatagory);
    Sports.reset();
    Sports.FetchData().then((_) {
      if(mounted) {
        setState(() {});
      }
    });

    Sports.pagination(
      refreshUI: () {
        if(mounted){
        setState(() {});
      }
      }
    );

  }

  void Dispose() {
    Sports.scrollController.dispose();
    super.dispose();
  }

  String SelectedCatagory = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            child: Card(
              elevation:4,
              child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  CustomWidget.choiceChip(
                    value: "India",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "India";
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
              
                              });
                            }
                          });
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                  CustomWidget.choiceChip(
                    value: "Sports",
                    selected: SelectedCatagory,
                    valueChanged: (selected) {
                      if (selected) {
                        SelectedCatagory = "Sports";
                        Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                        Sports.reset();
              
                        Sports.FetchData().then((_){
                              if(mounted){
                                setState(() {});
                              }
                        });
                      }
                    },
                  ),
                  CustomWidget.choiceChip(
                    value: "Business",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "Business";
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
                              });
                            }
                          });
              
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                  CustomWidget.choiceChip(
                    value: "IT",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "IT";
              
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
                              });
                            }
                          });
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                  CustomWidget.choiceChip(
                    value: "US",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "US";
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
                              });
                            }
                          });
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                  CustomWidget.choiceChip(
                    value: "Crypto",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "Crypto";
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
                              });
                            }
                          });
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                  CustomWidget.choiceChip(
                    value: "Share Market",
                    valueChanged: (selected) {
                      if (selected) {
                        setState(() {
                          SelectedCatagory = "ShareMarket";
                          Sports.StoreCatagory(SelectedCatagory: SelectedCatagory);
                          Sports.reset();
                          Sports.FetchData().then((_){
                            if(mounted){
                              setState(() {
              
                              });
                            }
                          });
                        });
                      }
                    },
                    selected: SelectedCatagory,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              child: Sports.allNews.isEmpty
                  ? Shimmerwidget()
                  : ListView.builder(
                      controller: Sports.scrollController,
                      itemCount:
                          Sports.allNews.length + (Sports.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == Sports.allNews.length) {

                          return Center(child: CircularProgressIndicator());
                        }
                        return Cata(index: index,);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cata extends StatelessWidget {
   var index;
  Cata({required this.index});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CDetail(index: index,)));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      Sports.allNews[index].imageUrl.toString()
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                Sports.allNews[index].title.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                Sports.allNews[index].description.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

