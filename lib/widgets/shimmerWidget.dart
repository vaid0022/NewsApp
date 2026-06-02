import 'package:flutter/material.dart';
import 'package:newsspp/Logics/Catagory/CatagoriesLogic.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerwidget extends StatelessWidget {
  const Shimmerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              title: Container(height: 15, color: Colors.white),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 12, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

class headLineshimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class ShimmerDetailNews extends StatelessWidget {
  const ShimmerDetailNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 20),
              Card(
                elevation: 8,
                child:
                    Container(
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                    ),

              ),
            ],
          );
        },
      ),
    );
  }
}
