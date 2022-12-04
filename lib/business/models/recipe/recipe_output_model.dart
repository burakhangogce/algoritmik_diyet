// To parse this JSON data, do
//
//     final recipeOutputModel = recipeOutputModelFromJson(jsonString);

import 'dart:convert';

List<RecipeOutputModel> recipeOutputModelFromJson(String str) =>
    List<RecipeOutputModel>.from(
        json.decode(str).map((x) => RecipeOutputModel.fromJson(x)));

String recipeOutputModelToJson(List<RecipeOutputModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeOutputModel {
  RecipeOutputModel({
    required this.recipeId,
    required this.nutritionistId,
    required this.recipeTitle,
    required this.recipeDesc,
  });

  int recipeId;
  int nutritionistId;
  String recipeTitle;
  String recipeDesc;

  factory RecipeOutputModel.fromJson(Map<String, dynamic> json) =>
      RecipeOutputModel(
        recipeId: json["recipeId"],
        nutritionistId: json["nutritionistId"],
        recipeTitle: json["recipeTitle"],
        recipeDesc: json["recipeDesc"],
      );

  Map<String, dynamic> toJson() => {
        "recipeId": recipeId,
        "nutritionistId": nutritionistId,
        "recipeTitle": recipeTitle,
        "recipeDesc": recipeDesc,
      };
}
