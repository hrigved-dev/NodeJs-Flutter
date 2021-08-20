import 'dart:convert';

import 'package:app/model/travelModel.dart';
import 'package:http/http.dart' as http;

class TravelProcess {
  List<TravelModel> travelList = [];

  Future<void> getPlaces() async {
    var url = Uri.parse("https://obscure-tundra-13251.herokuapp.com/places");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (int i = 0; i < jsonData.length; i++) {
        TravelModel travel = TravelModel(
            place: jsonData[i]['place'],
            country: jsonData[i]['country'],
            description: jsonData[i]['description'],
            imageUrl: jsonData[i]['images']);
        travelList.add(travel);
      }
    }
  }
}
