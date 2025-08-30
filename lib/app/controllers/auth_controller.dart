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
  
    Future<bool> signup({
      required String name,
      required String phone,
      required String email,
      required dynamic drivingLicense,
      required String aadhar,
      required dynamic aadharFile,
      required String pan,
      required dynamic panFile,
      required String vehicleReg,
      required dynamic vehicleRegFile,
      required dynamic vehicleRACFile,
      required String bankAccount,
      required String accountHolder,
      required String ifsc,
      required dynamic bankPassbookFile,
    }) async {
      isLoading.value = true;
      errorMessage.value = '';
      try {
        // Simulate API call delay
        await Future.delayed(const Duration(seconds: 2));
        // Basic validation
        if (name.isEmpty || phone.isEmpty || email.isEmpty || drivingLicense == null ||
            aadhar.isEmpty || aadharFile == null || pan.isEmpty || panFile == null ||
            vehicleReg.isEmpty || vehicleRegFile == null || vehicleRACFile == null ||
            bankAccount.isEmpty || accountHolder.isEmpty || ifsc.isEmpty || bankPassbookFile == null) {
          errorMessage.value = 'Please fill all fields and upload all documents.';
          return false;
        }
        // Here, you would send data and files to your backend
        // For demo, just return true
        return true;
      } catch (e) {
        errorMessage.value = 'Signup failed. Please try again.';
        return false;
      } finally {
        isLoading.value = false;
      }
    }
} 