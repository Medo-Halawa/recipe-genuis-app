import 'dart:convert';
import 'package:api_app/models/recipe.dart';
import 'package:http/http.dart' as http;
  class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
  var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
  {"limit": "5", "start": "0", "tag": "list.recipe.popular"});

  final response = await http.get(uri, headers: {
  "x-rapidapi-key": "ce11e74858msh05df5b01c6890fbp1beaa9jsn98ae7d58d38c",
  "x-rapidapi-host": "yummly2.p.rapidapi.com",
  "useQueryString": "true"
  });

  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['feed']) {
  _temp.add(i['content']['details']);
  }

  return Recipe.recipesFromSnapshot(_temp);
  }


  }
