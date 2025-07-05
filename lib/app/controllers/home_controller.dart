import 'package:get/get.dart';
import '../data/services/location_service.dart';
import '../data/services/order_service.dart';
import '../data/models/order_model.dart';

import 'dart:async';

class HomeController extends GetxController {
  final LocationService _locationService = LocationService();
  final OrderService _orderService = OrderService();

  final RxBool isLoading = false.obs;
  final RxBool isOnline = false.obs;
  final RxBool hasLocationPermission = false.obs;
  final RxList<OrderModel> availableOrders = <OrderModel>[].obs;
  final RxString currentLocation = ''.obs;
  final RxString errorMessage = ''.obs;

  Timer? _orderPollingTimer;

  @override
  void onInit() {
    super.onInit();
    checkLocationPermission();
  }
  
  Future<void> checkLocationPermission() async {
    final hasPermission = await _locationService.checkLocationPermission();
    hasLocationPermission.value = hasPermission;
    
    if (hasPermission) {
      await getCurrentLocation();
    }
  }
  
  Future<void> getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      if (position != null) {
        currentLocation.value = '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
      }
    } catch (e) {
      print('Error getting current location: $e');
    }
  }
  
  Future<void> toggleOnlineStatus() async {
    if (!hasLocationPermission.value) {
      final granted = await _locationService.requestLocationPermission();
      if (!granted) {
        errorMessage.value = 'Location permission is required to go online.';
        return;
      }
      hasLocationPermission.value = true;
    }

    isOnline.value = !isOnline.value;

    if (isOnline.value) {
      await getCurrentLocation();
      startOrderPolling();
    } else {
      stopOrderPolling();
    }
  }
  
  void startOrderPolling() {
    fetchAvailableOrders();
    _orderPollingTimer?.cancel();
    _orderPollingTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (isOnline.value) {
        fetchAvailableOrders();
      } else {
        timer.cancel();
      }
    });
  }

  void stopOrderPolling({bool clearOnline = true}) {
    _orderPollingTimer?.cancel();
    _orderPollingTimer = null;
    availableOrders.clear();
    if (clearOnline) {
      isOnline.value = false;
    }
  }
  
  Future<void> fetchAvailableOrders() async {
    if (!isOnline.value) return;
    
    try {
      final orders = await _orderService.getAvailableOrders();
      availableOrders.value = orders;
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }
  
  void showOrderPopup(OrderModel order) {
    Get.toNamed('/order-popup', arguments: order);
  }
  
  void clearError() {
    errorMessage.value = '';
  }
  
  @override
  void onClose() {
    stopOrderPolling();
    super.onClose();
  }
} 