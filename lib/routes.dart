import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/view/about_us_page.dart';
import 'package:ecommerce/view/address_page.dart';
import 'package:ecommerce/view/all_products_page.dart';
import 'package:ecommerce/view/archive_page.dart';
import 'package:ecommerce/view/cartpage.dart';
import 'package:ecommerce/view/contact_us_page.dart';
import 'package:ecommerce/view/notifications_page.dart';
import 'package:ecommerce/view/notifications_settings_page.dart';
import 'package:ecommerce/view/orders_page.dart';
import 'package:ecommerce/view/productdetils.dart';
import 'package:ecommerce/view/screen/auth/favorite.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:ecommerce/view/screen/auth/verifycodesginup.dart';
import 'package:ecommerce/view/screen/onboarding.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
    name: AppRoute.splash, // مسار صفحة البداية
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoute.language, // مسار صفحة اللغة
    page: () => const Language(),
  ),
  //GetPage(name: '/', page: () => const ProductDetails()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.home, page: () => const Homescreen()),
  GetPage(name: AppRoute.forgetPassword, page: () => const Forgetpassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const Verfiycode()),
  GetPage(name: AppRoute.resetPassword, page: () => const Resetpassword()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(
    name: AppRoute.successResetpassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignup()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.productDetils, page: () => const ProductDetails()),
  GetPage(name: AppRoute.favorite, page: () => FavoritesPage()),
  GetPage(name: AppRoute.cart, page: () => const CartPage()),
  GetPage(name: AppRoute.notifications, page: () => const NotificationsPage()),
  GetPage(
    name: AppRoute.notificationsSettings,
    page: () => const NotificationsSettingsPage(),
  ),
  GetPage(name: AppRoute.ordersPage, page: () => const OrdersPage()),
  GetPage(name: AppRoute.archivePage, page: () => const ArchivePage()),
  GetPage(name: AppRoute.addressPage, page: () => const AddressPage()),
  GetPage(name: AppRoute.aboutUsPage, page: () => const AboutUsPage()),
  GetPage(name: AppRoute.contactUsPage, page: () => const ContactUsPage()),
  GetPage(name: AppRoute.allproducts, page: () => const AllProductsPage()),
  GetPage(name: AppRoute.loadingpage, page: () => const LoadingPage()),
  GetPage(
    name: AppRoute.verfiyCodeSignUp,
    page: () => const VerfiyCodeSignUp(),
  ),
];
