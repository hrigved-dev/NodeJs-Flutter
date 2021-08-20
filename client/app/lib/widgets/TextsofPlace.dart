import 'package:flutter/material.dart';

class TextsofPlace extends StatefulWidget {
  final String place;
  final String country;
  final String description;

  TextsofPlace(
      {required this.place, required this.country, required this.description});

  @override
  _TextsofPlaceState createState() => _TextsofPlaceState();
}

class _TextsofPlaceState extends State<TextsofPlace> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.place,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        SizedBox(
          height: 1,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.amber,
            ),
            Text(
              widget.country,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          widget.description,
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
