import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  RxSet<String> favoriteProducts = <String>{}.obs;
  SharedPreferences? _prefs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    favoriteProducts.value = _prefs?.getStringList('favorites')?.toSet() ?? {};
  }

  Future<void> _saveFavorites() async {
    await _prefs?.setStringList('favorites', favoriteProducts.toList());
  }

  void toggleFavorite(String productId) {
    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }
    _saveFavorites();
  }

  bool isFavorite(String productId) {
    return favoriteProducts.contains(productId);
  }
}
