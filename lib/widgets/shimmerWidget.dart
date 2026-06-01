import 'package:flutter/material.dart';
import 'package:newsspp/Logics/Catagory/spots.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerwidget extends StatelessWidget {
  const Shimmerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white60,
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
                child:
                Container(height: 12, color: Colors.white),

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
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child:
            Container(
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

