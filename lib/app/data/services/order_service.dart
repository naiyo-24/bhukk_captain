import '../models/order_model.dart';

class OrderService {
  // Mock orders data
  final List<OrderModel> _mockOrders = [
    OrderModel(
      id: 'ORD001',
      customerName: 'John Doe',
      customerPhone: '+1234567890',
      restaurantName: 'Pizza Palace',
      restaurantAddress: '123 Main St, Downtown',
      deliveryAddress: '456 Oak Ave, Uptown',
      pickupLatitude: 40.7128,
      pickupLongitude: -74.0060,
      deliveryLatitude: 40.7589,
      deliveryLongitude: -73.9851,
      amount: 25.99,
      items: '1x Margherita Pizza, 2x Garlic Bread',
      status: 'pending',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      pickupOtp: '1234',
      deliveryOtp: '5678',
    ),
    OrderModel(
      id: 'ORD002',
      customerName: 'Jane Smith',
      customerPhone: '+1987654321',
      restaurantName: 'Burger House',
      restaurantAddress: '789 Elm St, Midtown',
      deliveryAddress: '321 Pine St, Downtown',
      pickupLatitude: 40.7505,
      pickupLongitude: -73.9934,
      deliveryLatitude: 40.7128,
      deliveryLongitude: -74.0060,
      amount: 18.50,
      items: '1x Cheeseburger, 1x French Fries, 1x Coke',
      status: 'pending',
      createdAt: DateTime.now().subtract(const Duration(minutes: 3)),
      pickupOtp: '4321',
      deliveryOtp: '8765',
    ),
  ];
  
  Future<List<OrderModel>> getAvailableOrders() async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    return _mockOrders;
  }
  
  Future<bool> acceptOrder(String orderId) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Update order status in mock data
    final orderIndex = _mockOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      _mockOrders[orderIndex] = _mockOrders[orderIndex].copyWith(status: 'accepted');
    }
    
    return true;
  }
  
  Future<bool> rejectOrder(String orderId) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Remove order from mock data
    _mockOrders.removeWhere((order) => order.id == orderId);
    return true;
  }
  
  Future<bool> verifyPickupOtp(String orderId, String otp) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Find order and verify OTP
    final order = _mockOrders.firstWhere((order) => order.id == orderId);
    return order.pickupOtp == otp;
  }
  
  Future<bool> verifyDeliveryOtp(String orderId, String otp) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Find order and verify OTP
    final order = _mockOrders.firstWhere((order) => order.id == orderId);
    return order.deliveryOtp == otp;
  }
  
  Future<bool> updateOrderStatus(String orderId, String status) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Update order status in mock data
    final orderIndex = _mockOrders.indexWhere((order) => order.id == orderId);
    if (orderIndex != -1) {
      _mockOrders[orderIndex] = _mockOrders[orderIndex].copyWith(status: status);
    }
    
    return true;
  }
  
  Future<bool> completeOrder(String orderId) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Remove completed order from mock data
    _mockOrders.removeWhere((order) => order.id == orderId);
    return true;
  }
} 