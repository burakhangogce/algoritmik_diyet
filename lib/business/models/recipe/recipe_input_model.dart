// To parse this JSON data, do
//
//     final recipeOutputModel = recipeOutputModelFromJson(jsonString);

import 'dart:convert';

List<RecipeInputModel> recipeOutputModelFromJson(String str) =>
    List<RecipeInputModel>.from(
        json.decode(str).map((x) => RecipeInputModel.fromJson(x)));

String recipeOutputModelToJson(List<RecipeInputModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeInputModel {
  RecipeInputModel({
    required this.nutritionistId,
    required this.recipeTitle,
    required this.recipeDesc,
  });

  int nutritionistId;
  String recipeTitle;
  String recipeDesc;

  factory RecipeInputModel.fromJson(Map<String, dynamic> json) =>
      RecipeInputModel(
        nutritionistId: json["nutritionistId"],
        recipeTitle: json["recipeTitle"],
        recipeDesc: json["recipeDesc"],
      );

  Map<String, dynamic> toJson() => {
        "nutritionistId": nutritionistId,
        "recipeTitle": recipeTitle,
        "recipeDesc": recipeDesc,
      };
}
