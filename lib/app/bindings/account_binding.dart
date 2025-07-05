import 'package:get/get.dart';
import '../controllers/account_controller.dart';
import '../controllers/auth_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController(), permanent: true);
    }
    
    // Initialize AccountController
    if (!Get.isRegistered<AccountController>()) {
      Get.put<AccountController>(AccountController(), permanent: true);
    }
  }
} 