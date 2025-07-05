import 'package:get/get.dart';
import '../data/services/order_service.dart';
import '../data/services/location_service.dart';
import '../data/models/order_model.dart';

class OrderController extends GetxController {
  final OrderService _orderService = OrderService();
  final LocationService _locationService = LocationService();
  
  final RxBool isLoading = false.obs;
  final Rx<OrderModel?> currentOrder = Rx<OrderModel?>(null);
  final RxString orderStatus = ''.obs;
  final RxString errorMessage = ''.obs;
  final RxString pickupOtp = ''.obs;
  final RxString deliveryOtp = ''.obs;
  final RxBool isPickupVerified = false.obs;
  final RxBool isDeliveryVerified = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Get order from arguments if passed
    final arguments = Get.arguments;
    if (arguments is OrderModel) {
      currentOrder.value = arguments;
      orderStatus.value = arguments.status;
    }
  }
  
  Future<bool> acceptOrder() async {
    if (currentOrder.value == null) return false;
    
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _orderService.acceptOrder(currentOrder.value!.id);
      
      if (success) {
        orderStatus.value = 'accepted';
        return true;
      } else {
        errorMessage.value = 'Failed to accept order. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<bool> rejectOrder() async {
    if (currentOrder.value == null) return false;
    
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _orderService.rejectOrder(currentOrder.value!.id);
      
      if (success) {
        Get.back(); // Go back to home screen
        return true;
      } else {
        errorMessage.value = 'Failed to reject order. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<bool> verifyPickupOtp(String otp) async {
    if (currentOrder.value == null) return false;
    
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _orderService.verifyPickupOtp(currentOrder.value!.id, otp);
      
      if (success) {
        isPickupVerified.value = true;
        pickupOtp.value = otp;
        orderStatus.value = 'picked_up';
        return true;
      } else {
        errorMessage.value = 'Invalid pickup OTP. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<bool> verifyDeliveryOtp(String otp) async {
    if (currentOrder.value == null) return false;
    
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      final success = await _orderService.verifyDeliveryOtp(currentOrder.value!.id, otp);
      
      if (success) {
        isDeliveryVerified.value = true;
        deliveryOtp.value = otp;
        orderStatus.value = 'delivered';
        return true;
      } else {
        errorMessage.value = 'Invalid delivery OTP. Please try again.';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  void completeOrder() {
    if (currentOrder.value == null) return;
    
    isLoading.value = true;
    errorMessage.value = '';
    
    try {
      _orderService.completeOrder(currentOrder.value!.id);
      orderStatus.value = 'completed';
    } catch (e) {
      errorMessage.value = 'Failed to complete order. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
  
  String getDistanceToPickup() {
    if (currentOrder.value == null) return '';
    
    // Mock current location - in real app, get from location service
    const currentLat = 40.7128;
    const currentLng = -74.0060;
    
    final distance = _locationService.calculateDistance(
      currentLat,
      currentLng,
      currentOrder.value!.pickupLatitude,
      currentOrder.value!.pickupLongitude,
    );
    
    return _locationService.formatDistance(distance);
  }
  
  String getDistanceToDelivery() {
    if (currentOrder.value == null) return '';
    
    final distance = _locationService.calculateDistance(
      currentOrder.value!.pickupLatitude,
      currentOrder.value!.pickupLongitude,
      currentOrder.value!.deliveryLatitude,
      currentOrder.value!.deliveryLongitude,
    );
    
    return _locationService.formatDistance(distance);
  }
  
  void clearError() {
    errorMessage.value = '';
  }
  
  void resetOrder() {
    currentOrder.value = null;
    orderStatus.value = '';
    pickupOtp.value = '';
    deliveryOtp.value = '';
    isPickupVerified.value = false;
    isDeliveryVerified.value = false;
    errorMessage.value = '';
  }
} 