import 'package:app/widgets/ImageViews.dart';
import 'package:app/widgets/ImagesList.dart';
import 'package:app/widgets/TextsofPlace.dart';
import 'package:flutter/material.dart';

class PlaceOverview extends StatefulWidget {
  final String mainImage;
  final String place;
  final String country;
  final String description;
  final List<dynamic> imgUrl;

  PlaceOverview({
    required this.mainImage,
    required this.place,
    required this.country,
    required this.description,
    required this.imgUrl,
  });

  @override
  _PlaceOverviewState createState() => _PlaceOverviewState();
}

class _PlaceOverviewState extends State<PlaceOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            ImageViews(
              mainImage: widget.mainImage,
              images: widget.imgUrl,
            ),
            SizedBox(height: 15),
            ImagesList(images: widget.imgUrl),
            SizedBox(height: 15),
            TextsofPlace(
              place: widget.place,
              country: widget.country,
              description: widget.description,
            ),
          ],
        ),
      ),
    );
  }
}
