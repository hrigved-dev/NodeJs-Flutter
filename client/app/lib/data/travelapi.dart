import 'dart:convert';

import 'package:app/model/travelModel.dart';
import 'package:http/http.dart' as http;

class TravelProcess {
  Future<List<TravelModel>> getPlaces() async {
    var url = Uri.parse("https://obscure-tundra-13251.herokuapp.com/places");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return (jsonData as List<dynamic>)
          .map((item) => TravelModel(
              place: item['place'],
              country: item['country'],
              description: item['description'],
              imageUrl: item['images']))
          .toList();
    }
    // TODO: Log error if statusCode != 200
    return [];
  }
}
