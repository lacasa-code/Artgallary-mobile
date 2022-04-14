import 'package:active_ecommerce_flutter/data_model/category_response.dart';
import 'package:active_ecommerce_flutter/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  List<Category> _featuredCategoryList = [];
  List<Category> get featuredCategoryList => [..._featuredCategoryList];
  fetchFeaturedCategories() async {
    var categoryResponse = await CategoryRepository().getFeturedCategories();
    if (categoryResponse == null) {
      return;
    }
    _featuredCategoryList = categoryResponse.categories;
    notifyListeners();
  }
}
