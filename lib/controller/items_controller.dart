import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changCat(int val);
  goToPageProductDetils();
}

class ItemsControllerImp extends ItemsController {
  void showAllItems() {
    selectedCat = null; // Reset selected category
    currentItems.value = allItems;
    searchController.clear(); // Clear any existing search query
    searchQuery = null;
    update(); // Notify UI to update
  }

  List categories = ['shose', 'dress', 'laptop', 'mobile', 'camera'];
  RxList<Map<String, dynamic>> currentItems = <Map<String, dynamic>>[].obs;
  int? selectedCat;
  TextEditingController searchController = TextEditingController();
  String? searchQuery;

  List<Map<String, dynamic>> allItems = [
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
      'title': 'Mirrorless  ',
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
  ];

  @override
  void onInit() {
    intialData();
    searchController.addListener(_onSearchChanged);
    super.onInit();
  }

  @override
  intialData() {
    final args = Get.arguments;
    if (args != null && args.containsKey('selectedcat')) {
      selectedCat = args['selectedcat'];
    } else {
      selectedCat = 0;
    }
    _filterItemsByCategory(selectedCat);
  }

  @override
  changCat(val) {
    selectedCat = val;
    _filterItemsByCategory(val);
    update();
  }

  @override
  goToPageProductDetils() {
    Get.toNamed("productdetils");
  }

  void _filterItemsByCategory(int? categoryIndex) {
    if (categoryIndex != null) {
      String category = categories[categoryIndex];
      currentItems.value =
          allItems.where((item) => item['category'] == category).toList();
      if (searchQuery != null && searchQuery!.isNotEmpty) {
        _filterItemsBySearch(searchQuery!);
      }
    } else {
      currentItems.value = allItems;
      if (searchQuery != null && searchQuery!.isNotEmpty) {
        _filterItemsBySearch(searchQuery!);
      }
    }
  }

  void _filterItemsBySearch(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      _filterItemsByCategory(selectedCat);
    } else {
      currentItems.value =
          allItems
              .where((item) {
                final titleLower = item['title'].toString().toLowerCase();
                final queryLower = query.toLowerCase();
                return titleLower.contains(
                  queryLower,
                ); // البحث في اسم المنتج فقط
              })
              .where((item) {
                if (selectedCat != null) {
                  return item['category'] == categories[selectedCat!];
                }
                return true;
              })
              .toList();
    }
  }

  void _onSearchChanged() {
    final query = searchController.text;
    _filterItemsBySearch(query);
  }
}
