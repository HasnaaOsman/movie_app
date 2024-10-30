import 'package:flutter/material.dart';

import '../data/browse_data/browse_data.dart';
import '../data/browse_data/categories_api_data.dart';
import '../data/models/genres_movies.dart';

class CategoryViewModel extends ChangeNotifier {
  BrowseData browseData = CategoriesApiData();
  List<Genres> categoryMovies = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getCategory() async {
    isLoading = true;
    notifyListeners();
    try {
      categoryMovies = await browseData.getCategory();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
