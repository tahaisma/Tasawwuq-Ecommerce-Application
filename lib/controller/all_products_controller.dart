import 'package:get/get.dart';

class AllProductsController extends GetxController {
  RxList<Map<String, dynamic>> allProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // هنا هنستدعي الدالة اللي هتجيب بيانات المنتجات بتاعتك
    fetchProducts();
  }

  // دالة وهمية لجلب المنتجات (هتستبدلها بدالتك الحقيقية)
  Future<void> fetchProducts() async {
    // في الواقع، هنا هيكون كود يجيب البيانات من قاعدة البيانات أو الـ API
    // لكن دلوقتي هنستخدم بيانات وهمية مؤقتة زي ما كانت
    await Future.delayed(
      const Duration(seconds: 1),
    ); // محاكاة عملية جلب البيانات

    // استبدل البيانات دي ببيانات منتجاتك الحقيقية
    allProducts.value = [
      {
        'image': 'assets/images/laptop.png',
        'price': '200.10 \$',
        'title': 'Laptop Dell',
        'description': 'Core i7 - 16 GB - RAM 512 GB SSD',
        'rating': 4.5,
        'category': 'laptop',
      },
      {
        'image': 'assets/images/lap2.png',
        'price': '200.10 \$',
        'title': 'Laptop HP',
        'description': 'Intel Core i7 Intel Core i5, Laptop',
        'rating': 4.5,
        'category': 'laptop',
      },
      {
        'image': 'assets/images/lap3.png',
        'price': '200.10 \$',
        'title': 'Dell',
        'description': 'Toshiba Satellite Ultrabook',
        'rating': 4.5,
        'category': 'laptop',
      },
      {
        'image': 'assets/images/lap4.png',
        'price': '200.10 \$',
        'title': 'MacBook',
        'description': 'MacBook Pro\n 13-inch',
        'rating': 4.5,
        'category': 'laptop',
      },
      {
        'image': 'assets/images/d.png',
        'price': '150.50 \$',
        'title': 'Dress',
        'description': 'Beautiful elegant dress',
        'rating': 3.0,
        'category': 'dress',
      },
      {
        'image': 'assets/images/1.png',
        'price': '250.50 \$',
        'title': 'Iphone pro max',
        'description': 'Latest smartphone model',
        'rating': 4.0,
        'category': 'mobile',
      },
      {
        'image': 'assets/images/m2.png',
        'price': '250.50 \$',
        'title': 'Iphone 13',
        'description': 'Latest smartphone model',
        'rating': 4.0,
        'category': 'mobile',
      },

      {
        'image': 'assets/images/m4.png',
        'price': '250.50 \$',
        'title': 'Realme c75',
        'description': 'Latest smartphone model',
        'rating': 4.0,
        'category': 'mobile',
      },
      {
        'image': 'assets/images/m5.png',
        'price': '250.50 \$',
        'title': 'Vivo',
        'description': 'Vivo v50 lite',
        'rating': 4.0,
        'category': 'mobile',
      },
      {
        'image': 'assets/images/5.png',
        'price': '270.50 \$',
        'title': 'Camera Pro',
        'description': 'High-quality camera',
        'rating': 3.0,
        'category': 'camera',
      },
      {
        'image': 'assets/images/c3.png',
        'price': '500.00 \$',
        'title': 'Mirrorless Cameras ',
        'description': 'High-quality camera',
        'rating': 3.0,
        'category': 'camera',
      },
      {
        'image': 'assets/images/c2.png',
        'price': '300.50 \$',
        'title': 'Bridge Cameras',
        'description': 'High-quality camera',
        'rating': 3.0,
        'category': 'camera',
      },
      {
        'image': 'assets/images/s.png',
        'price': '250.50 \$',
        'title': ' modern Shoes',
        'description': 'Comfortable running shoes.',
        'rating': 4.0,
        'category': 'shose',
      },
      {
        'image': 'assets/images/s2.png',
        'price': '200.50 \$',
        'title': 'Nike Sport Shoes',
        'description': 'Comfortable running shoes.',
        'rating': 4.0,
        'category': 'shose',
      },
      {
        'image': 'assets/images/s3.png',
        'price': '450.50 \$',
        'title': ' Nike Sneakers',
        'description': 'Max Shoe Sneakers',
        'rating': 4.0,
        'category': 'shose',
      },
      {
        'image': 'assets/images/s4.png',
        'price': '350.50 \$',
        'title': ' Nike Air Zoom ',
        'description': 'Nike Mens Air Zoom Vomero 12 ',
        'rating': 4.0,
        'category': 'shose',
      },

      // ... باقي منتجاتك ...
    ];
  }
}
