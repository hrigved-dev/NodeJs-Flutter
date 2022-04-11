import 'package:app/widgets/BackButton.dart';
import 'package:flutter/material.dart';

class ImageViews extends StatefulWidget {
  final String mainImage;
  final List<dynamic> images;

  ImageViews({required this.images, required this.mainImage});

  @override
  _ImageViewsState createState() => _ImageViewsState();
}

class _ImageViewsState extends State<ImageViews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      height: 350,
      width: 500,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'mainImage',
                child: Image.network(
                  widget.mainImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10), child: BackButtonImage()),
        ],
      ),
    );
  }
}
