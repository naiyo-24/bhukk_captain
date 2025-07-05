


class AuthService {
  // Simple in-memory storage for demo purposes
  String? _authToken;
  String? _phoneNumber;
  
  Future<bool> sendOtp(String phoneNumber) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock successful response
    _phoneNumber = phoneNumber;
    return true;
  }
  
  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock OTP verification for demo purposes
    if (otp == '123456') { // Mock OTP for testing
      // Store auth token
      _authToken = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';
      _phoneNumber = phoneNumber;
      return true;
    }
    
    return false;
  }
  
  String? getAuthToken() {
    return _authToken;
  }
  
  String? getPhoneNumber() {
    return _phoneNumber;
  }
  
  void logout() {
    _authToken = null;
    _phoneNumber = null;
  }
  
  bool isLoggedIn() {
    return _authToken != null;
  }
} 