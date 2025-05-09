import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/view/cartpage.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  int countitems = 0;

  intialData() {
    countitems = 0;
    update();
  }

  List subitems = [
    {"name": "Red", "id": 1, "active": '0', "color": "0xFFFF0000"},
    {"name": "Yellow", "id": 2, "active": '0', "color": "0xFFFFFF00"},
    {"name": "Black", "id": 3, "active": '1', "color": "0xFF000000"},
  ];

  // دالة لإضافة المنتج إلى السلة والانتقال لصفحة السلة
  void addToCart(String productTitle) {
    final CartController cartController = Get.find<CartController>();
    // هنا هنضيف المنتج للسلة بالكمية اللي اختارها المستخدم (countitems)
    cartController.addItemWithQuantity(productTitle, countitems);
    Get.snackbar(
      'Added to Cart',
      '$countitems x $productTitle has been added to your cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    Get.to(() => const CartPage()); // الانتقال لصفحة السلة بعد الإضافة
  }

  add() {
    // دالة لزيادة العداد فقط
    countitems++;
    update();
  }

  remove() {
    // دالة لتقليل العداد فقط
    if (countitems > 0) {
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
