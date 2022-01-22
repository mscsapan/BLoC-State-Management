import 'dart:convert';

import 'package:bloc_library/food/model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodNetwork {
  //final String uri = 'https://forkify-api.herokuapp.com/api/search?q=pizza';
  final String uri =
      'https://api.json-generator.com/templates/TqwPkiDU2RHY/data?access_token=ih52t2vjmywxe3vl6tmmr4ylz2stbttjn2krky6m';

  Future<List<Recipe>> getNetworkFood() async {
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Recipe>? recipe = Food.fromJson(jsonData).recipes;
      debugPrint('${recipe!.length}');
      return recipe;
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
