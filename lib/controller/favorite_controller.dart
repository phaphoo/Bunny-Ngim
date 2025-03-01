import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'dart:convert';

class FavoriteController extends GetxController implements GetxService {
  final _storage = GetStorage();
  List<Product> favoriteProducts = [];

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      favoriteProducts.removeWhere((p) => p.id == product.id);
    } else {
      favoriteProducts.add(product);
    }
    _saveFavorites();
    update();
  }

  bool isFavorite(Product product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }

  void _saveFavorites() {
    List<String> jsonList =
        favoriteProducts.map((p) => jsonEncode(p.toJson())).toList();
    _storage.write('favorite_products', jsonList);
  }

  void loadFavorites() {
    List<dynamic>? storedList = _storage.read(
      'favorite_products',
    ); // Read as List<dynamic>

    if (storedList != null) {
      List<String> jsonList = List<String>.from(
        storedList,
      ); // Convert to List<String>
      favoriteProducts =
          jsonList
              .map((json) => Product.fromJson(jsonDecode(json)))
              .toList()
              .reversed
              .toList();
      update();
    }
  }
}
