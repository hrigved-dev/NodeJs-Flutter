import 'package:app/screens/PlaceOverview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Scrollitems extends StatefulWidget {
  final String mainImage;
  final String place;
  final String country;
  final String description;
  final List<dynamic> images;

  Scrollitems(
      {required this.mainImage,
      required this.place,
      required this.country,
      required this.description,
      required this.images});

  @override
  _ScrollitemsState createState() => _ScrollitemsState();
}

class _ScrollitemsState extends State<Scrollitems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 200,
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlaceOverview(
                    place: widget.place,
                    country: widget.country,
                    mainImage: widget.mainImage,
                    description: widget.description,
                    imgUrl: widget.images,
                  )));
        },
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'mainImage',
                child: CachedNetworkImage(
                  imageUrl: widget.mainImage,
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.place,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
