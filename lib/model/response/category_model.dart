import 'dart:convert';

class CategoryModel {
  Map<int, String> categories;

  CategoryModel({required this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categories: json.map((key, value) => MapEntry(int.parse(key), value)),
  );

  Map<String, dynamic> toJson() =>
      categories.map((key, value) => MapEntry(key.toString(), value));
}

// Example usage:
// final category = CategoryModel.fromJson(jsonDecode(jsonString));
// print(jsonEncode(category.toJson()));
