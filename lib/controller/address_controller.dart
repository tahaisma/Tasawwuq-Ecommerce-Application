import 'package:get/get.dart';

class Address {
  final String name;
  final String street;
  final String city;

  Address({required this.name, required this.street, required this.city});
}

class AddressController extends GetxController {
  RxList<Address> addresses =
      <Address>[
        Address(name: "Home", street: "Main Street 1", city: "Alexandria"),
        Address(name: "the job", street: "commercial street 5", city: "Cairo"),
      ].obs;

  void editAddress(Address address) {
    print("تعديل العنوان: ${address.name}");
    // هنا ممكن نضيف logic وهمي لفتح صفحة التعديل
  }

  void deleteAddress(Address address) {
    print("حذف العنوان: ${address.name}");
    addresses.remove(address);
  }
}
