class Recipe{
  String label, imageUrl, url, source;
  List<dynamic> ingredient;
  Recipe({this.label, this.imageUrl, this.url, this.source, this.ingredient});

  factory Recipe.fromMap(Map<String,dynamic>jsonData){
    return Recipe(
      url:jsonData["url"],
      imageUrl:jsonData["image"],
      source:jsonData["source"],
      label:jsonData["label"],
      ingredient: jsonData["ingredientLines"]
    );
  }
}