import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/controller/items_controller.dart'; // عشان نوصل لبيانات المنتج الثابتة

class CartController extends GetxController {
  RxMap<String, int> cartItems = <String, int>{}.obs;
  final ItemsControllerImp itemsController = Get.find<ItemsControllerImp>();
  SharedPreferences? _prefs;

  @override
  void onInit() {
    super.onInit();
    _loadCart();
  }

  Future<void> _loadCart() async {
    _prefs = await SharedPreferences.getInstance();
    final storedCart = _prefs?.getStringList('cart');
    if (storedCart != null) {
      for (var item in storedCart) {
        final parts = item.split(':');
        if (parts.length == 2) {
          cartItems[parts[0]] = int.tryParse(parts[1]) ?? 1;
        }
      }
    }
  }

  Future<void> _saveCart() async {
    final List<String> cartList =
        cartItems.entries.map((e) => '${e.key}:${e.value}').toList();
    await _prefs?.setStringList('cart', cartList);
  }

  void addItem(String productTitle) {
    final quantity = cartItems[productTitle];
    cartItems[productTitle] = (quantity == null) ? 1 : quantity + 1;
    _saveCart();
  }

  // دالة جديدة لإضافة المنتج بكمية محددة
  void addItemWithQuantity(String productTitle, int quantity) {
    cartItems[productTitle] =
        quantity > 0 ? quantity : 1; // تأكد إن الكمية مش أقل من 1
    _saveCart();
  }

  void removeItem(String productTitle) {
    final quantity = cartItems[productTitle];
    if (quantity != null) {
      if (quantity > 1) {
        cartItems[productTitle] = quantity - 1;
      } else {
        cartItems.remove(productTitle);
      }
      _saveCart();
    }
  }

  void deleteItem(String productTitle) {
    cartItems.remove(productTitle);
    _saveCart();
  }

  int getItemCount(String productTitle) {
    return cartItems[productTitle] ?? 0;
  }

  double get subtotal {
    double total = 0;
    cartItems.forEach((title, quantity) {
      final product = itemsController.allItems.firstWhereOrNull(
        (p) => p['title'] == title,
      );
      if (product != null) {
        final priceString = product['price']?.toString().replaceAll(
          RegExp(r'[^\d\.]'),
          '',
        );
        final price = double.tryParse(priceString ?? '0') ?? 0;
        total += price * quantity;
      }
    });
    return total;
  }

  double get total {
    return subtotal;
  }

  // دالة لتفريغ السلة
  void clearCart() {
    cartItems.clear();
    _saveCart(); // حفظ السلة بعد تفريغها
  }
}
