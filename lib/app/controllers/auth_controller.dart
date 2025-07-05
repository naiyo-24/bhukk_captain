import 'package:get/get.dart';
import '../data/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;
  final RxString phoneNumber = ''.obs;
  final RxString errorMessage = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }
  
  void checkLoginStatus() {
    final loggedIn = _authService.isLoggedIn();
    isLoggedIn.value = loggedIn;
    
    if (loggedIn) {
      final phone = _authService.getPhoneNumber();
      phoneNumber.value = phone ?? '';
    }
  }
  
  Future<bool> sendOtp(String phone) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _authService.sendOtp(phone);
      
      if (success) {
        phoneNumber.value = phone;
        return true;
      } else {
        errorMessage.value = 'Failed to send OTP. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<bool> verifyOtp(String otp) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _authService.verifyOtp(phoneNumber.value, otp);
      
      if (success) {
        isLoggedIn.value = true;
        return true;
      } else {
        errorMessage.value = 'Invalid OTP. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  void logout() {
    isLoading.value = true;
    
    try {
      _authService.logout();
      isLoggedIn.value = false;
      phoneNumber.value = '';
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = 'Error logging out. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
  
  void clearError() {
    errorMessage.value = '';
  }
} 