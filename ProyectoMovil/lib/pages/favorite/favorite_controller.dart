import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:timeapp/pages/productos/producto_controller.dart';

class FavoriteController extends GetxController {
  RxList<Product> favoritos = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void addToFavorites(Product product) {
    if (!favoritos.any((p) => p.id == product.id)) {
      favoritos.add(product);
      saveFavorites();
    }
  }

  void removeFromFavorites(Product product) {
    favoritos.removeWhere((p) => p.id == product.id);
    product.isFavorite = false;
    saveFavorites();
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favList = favoritos.map((p) => jsonEncode(p.toJson())).toList();
    prefs.setStringList('favoritos', favList);
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favList = prefs.getStringList('favoritos');
    if (favList != null) {
      favoritos.assignAll(favList.map((item) => Product.fromJson(jsonDecode(item))).toList());
    }
  }
}
