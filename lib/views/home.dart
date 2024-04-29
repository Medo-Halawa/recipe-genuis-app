import 'package:api_app/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import '../models/recipe.api.dart';
import '../models/recipe.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? _recipes;
  bool _isloading= true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipes();
  }
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isloading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width:10 ,),
            Text('Recipe Genuis')
          ],
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _recipes?.length,
        itemBuilder: (context, index) {
          return RecipeCard(
              title: _recipes![index].name.toString(),
              cookTime: _recipes![index].totalTime.toString(),
              rating: _recipes![index].rating.toString(),
              thumbnailUrl: _recipes![index].images.toString());
        },
      ));
  }
}
