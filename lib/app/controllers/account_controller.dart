import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class AccountController extends GetxController {
  late AuthController authController;
  
  // Account data
  final RxString fullName = 'Delivery Partner'.obs;
  final RxString phoneNumber = '+1234567890'.obs;
  final RxString email = 'delivery@bhukk.com'.obs;
  final RxString vehicleNumber = 'DL-01-AB-1234'.obs;
  final RxString vehicleType = 'Two Wheeler'.obs;
  
  // Stats
  final RxInt totalDeliveries = 156.obs;
  final RxDouble totalEarnings = 1234.0.obs;
  final RxDouble rating = 4.8.obs;
  final RxString memberSince = '3 months'.obs;
  
  @override
  void onInit() {
    super.onInit();
    print('AccountController initialized');
    
    // Initialize auth controller
    try {
      authController = Get.find<AuthController>();
      print('AuthController found');
    } catch (e) {
      print('AuthController not found, creating new instance');
      authController = Get.put(AuthController(), permanent: true);
    }
    
    // Initialize with auth controller data
    phoneNumber.value = authController.phoneNumber.value.isNotEmpty 
        ? authController.phoneNumber.value 
        : '+1234567890';
    print('Phone number set to: ${phoneNumber.value}');
  }
  
  void navigateToEditAccount() {
    print('Attempting to navigate to edit account screen');
    try {
      // Check if route exists
      final routes = Get.routing.current;
      print('Current route: $routes');
      print('Available routes: ${Get.routing}');
      
      Get.toNamed('/edit-account');
      print('Navigation successful');
    } catch (e) {
      print('Navigation error: $e');
      Get.snackbar(
        'Navigation Error',
        'Unable to navigate to edit account screen: $e',
        backgroundColor: Colors.red.shade50,
        colorText: Colors.red.shade700,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 5),
      );
    }
  }
  
  void updateProfile({
    String? name,
    String? email,
    String? vehicleNumber,
    String? vehicleType,
  }) {
    if (name != null) fullName.value = name;
    if (email != null) this.email.value = email;
    if (vehicleNumber != null) this.vehicleNumber.value = vehicleNumber;
    if (vehicleType != null) this.vehicleType.value = vehicleType;
    
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      backgroundColor: Colors.green.shade50,
      colorText: Colors.green.shade700,
      snackPosition: SnackPosition.TOP,
    );
  }
  
  void logout() {
    authController.logout();
    Get.offAllNamed('/login');
  }
} 