import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/bindings/auth_binding.dart';
import 'app/bindings/home_binding.dart';
import 'app/bindings/order_binding.dart';
import 'app/bindings/account_binding.dart';
import 'app/controllers/auth_controller.dart';
import 'app/controllers/account_controller.dart';

void main() {
  runApp(const BhukkDeliveryApp());
}

class BhukkDeliveryApp extends StatelessWidget {
  const BhukkDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bhukk Delivery Partner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        // Initialize all required controllers
        Get.put(AuthController(), permanent: true);
        Get.put(AccountController(), permanent: true);
      }),
    );
  }
}
