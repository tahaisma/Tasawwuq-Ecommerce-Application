import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/order_confirmation_page.dart'; // استورد صفحة تأكيد الطلب
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _paymentMethod;
  String? _deliveryType;
  String? _selectedAddress; // لتتبع عنوان الشحن المختار

  // قائمة مؤقتة لعناوين الشحن
  final List<String> _shippingAddresses = [
    'Home\nHama Street Two Building 2',
    'Company\nDamascus Street One Building 4',
  ];

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final ItemsControllerImp itemsController = Get.find<ItemsControllerImp>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: AppColor.primaryColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _paymentMethod = 'cash';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _paymentMethod == 'cash'
                        ? AppColor.primaryColor
                        : Colors.grey.shade300,
                foregroundColor:
                    _paymentMethod == 'cash' ? Colors.white : Colors.black,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Cash On Delivery'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _paymentMethod = 'card';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _paymentMethod == 'card'
                        ? AppColor.primaryColor
                        : Colors.grey.shade300,
                foregroundColor:
                    _paymentMethod == 'card' ? Colors.white : Colors.black,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Payment Cards'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Choose Delivery Type',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _deliveryType = 'delivery';
                      _selectedAddress =
                          _shippingAddresses
                              .first; // اختيار أول عنوان افتراضيًا عند اختيار التوصيل
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color:
                          _deliveryType == 'delivery'
                              ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.2)
                              : Colors.white,
                      border: Border.all(
                        color:
                            _deliveryType == 'delivery'
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.delivery_dining, size: 40),
                        const SizedBox(height: 8),
                        const Text('Delivery'),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _deliveryType = 'revice';
                      _selectedAddress =
                          null; // مسح العنوان لما يكون استلام من الفرع
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color:
                          _deliveryType == 'revice'
                              ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.2)
                              : Colors.white,
                      border: Border.all(
                        color:
                            _deliveryType == 'revice'
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.storefront, size: 40),
                        const SizedBox(height: 8),
                        const Text('Revice'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_deliveryType == 'delivery')
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedAddress =
                            _shippingAddresses[0]; // اختيار عنوان المنزل
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedAddress == _shippingAddresses[0]
                              ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1)
                              : Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color:
                            _selectedAddress == _shippingAddresses[0]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade300,
                      ),
                      minimumSize: const Size(double.infinity, 60),
                      alignment: Alignment.centerLeft,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secoundColor,
                          ),
                        ),
                        Text(
                          _shippingAddresses[0].split('\n')[1],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 79, 78, 78),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedAddress =
                            _shippingAddresses[1]; // اختيار عنوان الشركة
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedAddress == _shippingAddresses[1]
                              ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.2)
                              : Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color:
                            _selectedAddress == _shippingAddresses[1]
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade300,
                      ),
                      minimumSize: const Size(double.infinity, 60),
                      alignment: Alignment.centerLeft,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Company',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secoundColor,
                          ),
                        ),
                        Text(
                          _shippingAddresses[1].split('\n')[1],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 79, 78, 78),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_paymentMethod != null &&
                      _deliveryType != null &&
                      (_deliveryType == 'revice' || _selectedAddress != null)) {
                    // تجهيز بيانات الطلب
                    final cartItems = cartController.cartItems;
                    final totalPrice = cartController.total;
                    final paymentMethod = _paymentMethod!;
                    final deliveryType = _deliveryType!;
                    final shippingAddress = _selectedAddress;

                    print('--- Order Details ---');
                    print('Cart Items: $cartItems');
                    print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
                    print('Payment Method: $paymentMethod');
                    print('Delivery Type: $deliveryType');
                    print('Shipping Address: $shippingAddress');
                    print('---------------------');

                    Get.snackbar(
                      'Success',
                      'Your order has been placed successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.shade400,
                      colorText: Colors.white,
                    );

                    // نفضي السلة وننتقل لصفحة تأكيد الطلب
                    cartController.clearCart();
                    Get.off(() => const OrderConfirmationPage());
                  } else {
                    Get.snackbar(
                      'Warning',
                      'Please choose payment method, delivery type, and shipping address (if delivery).',
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Checkout', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
