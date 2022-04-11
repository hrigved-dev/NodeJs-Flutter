import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesList extends StatefulWidget {
  final List<dynamic> images;

  ImagesList({required this.images});

  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.blueGrey[100]),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 100,
                width: 170,
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
