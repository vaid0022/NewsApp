import 'package:flutter/material.dart';
import 'package:newsspp/screens/CatagoriesDetail.dart';
import 'package:newsspp/widgets/Text.dart';
import 'package:newsspp/widgets/shimmerWidget.dart';
import 'package:newsspp/widgets/widget.dart';

import '../Logics/Catagory/CatagoriesLogic.dart';

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
    CatagoriesLogic.StoreCatagory(SelectedCatagory: SelectedCatagory);
    CatagoriesLogic.reset();
    CatagoriesLogic.FetchData().then((_) {
      if (mounted) {
        setState(() {});
      }
    });

    CatagoriesLogic.pagination(
      refreshUI: () {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }


  String SelectedCatagory = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: ()async{
          CatagoriesLogic.reset();
          await CatagoriesLogic.FetchData();
          if(mounted){
            setState(() {
            });
          }
        },
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              child: Card(
                elevation: 4,
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
                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
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
                          CatagoriesLogic.StoreCatagory(
                            SelectedCatagory: SelectedCatagory,
                          );
                          CatagoriesLogic.reset();

                          CatagoriesLogic.FetchData().then((_) {
                            if (mounted) {
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
                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
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

                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
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
                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
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
                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
                              }
                            });
                          });
                        }
                      },
                      selected: SelectedCatagory,
                    ),
                    CustomWidget.choiceChip(
                      value: "ShareMarket",
                      valueChanged: (selected) {
                        if (selected) {
                          setState(() {
                            SelectedCatagory = "ShareMarket";
                            CatagoriesLogic.StoreCatagory(
                              SelectedCatagory: SelectedCatagory,
                            );
                            CatagoriesLogic.reset();
                            CatagoriesLogic.FetchData().then((_) {
                              if (mounted) {
                                setState(() {});
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
                child: CatagoriesLogic.allNews.isEmpty
                    ? Shimmerwidget()
                    : ListView.builder(
                        controller: CatagoriesLogic.scrollController,
                        itemCount:
                            CatagoriesLogic.allNews.length +
                            (CatagoriesLogic.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == CatagoriesLogic.allNews.length) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Cata(index: index);
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

class Cata extends StatelessWidget {
  var index;
  Cata({required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CDetail(index: index)),
          );
        },
        child: Card(
          child: SizedBox(
            height: 200,
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        CatagoriesLogic.allNews[index].imageUrl ??
                            "https://www.dreamstime.com/stock-illustration-not-available-red-rubber-stamp-over-white-background-image87242466",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        TextPadding(
                          text:
                              CatagoriesLogic.allNews[index].title ??
                              "Tital is Not Available",
                          fontSize: 20,
                          padding: 10,
                          isBold: true,
                          lines: 2,
                          isLines: true,
                        ),
                        TextPadding(
                          text:
                              CatagoriesLogic.allNews[index].description ??
                              "Tital is Not Available",
                          fontSize: 18,
                          padding: 10,
                          isBold: false,
                          lines: 3,
                          isLines: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
