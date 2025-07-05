class OrderModel {
  final String id;
  final String customerName;
  final String customerPhone;
  final String restaurantName;
  final String restaurantAddress;
  final String deliveryAddress;
  final double pickupLatitude;
  final double pickupLongitude;
  final double deliveryLatitude;
  final double deliveryLongitude;
  final double amount;
  final String items;
  final String status;
  final DateTime createdAt;
  final String? pickupOtp;
  final String? deliveryOtp;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.deliveryAddress,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.deliveryLatitude,
    required this.deliveryLongitude,
    required this.amount,
    required this.items,
    required this.status,
    required this.createdAt,
    this.pickupOtp,
    this.deliveryOtp,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      customerName: json['customerName'] ?? '',
      customerPhone: json['customerPhone'] ?? '',
      restaurantName: json['restaurantName'] ?? '',
      restaurantAddress: json['restaurantAddress'] ?? '',
      deliveryAddress: json['deliveryAddress'] ?? '',
      pickupLatitude: (json['pickupLatitude'] ?? 0.0).toDouble(),
      pickupLongitude: (json['pickupLongitude'] ?? 0.0).toDouble(),
      deliveryLatitude: (json['deliveryLatitude'] ?? 0.0).toDouble(),
      deliveryLongitude: (json['deliveryLongitude'] ?? 0.0).toDouble(),
      amount: (json['amount'] ?? 0.0).toDouble(),
      items: json['items'] ?? '',
      status: json['status'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      pickupOtp: json['pickupOtp'],
      deliveryOtp: json['deliveryOtp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'restaurantName': restaurantName,
      'restaurantAddress': restaurantAddress,
      'deliveryAddress': deliveryAddress,
      'pickupLatitude': pickupLatitude,
      'pickupLongitude': pickupLongitude,
      'deliveryLatitude': deliveryLatitude,
      'deliveryLongitude': deliveryLongitude,
      'amount': amount,
      'items': items,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'pickupOtp': pickupOtp,
      'deliveryOtp': deliveryOtp,
    };
  }

  OrderModel copyWith({
    String? id,
    String? customerName,
    String? customerPhone,
    String? restaurantName,
    String? restaurantAddress,
    String? deliveryAddress,
    double? pickupLatitude,
    double? pickupLongitude,
    double? deliveryLatitude,
    double? deliveryLongitude,
    double? amount,
    String? items,
    String? status,
    DateTime? createdAt,
    String? pickupOtp,
    String? deliveryOtp,
  }) {
    return OrderModel(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantAddress: restaurantAddress ?? this.restaurantAddress,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      pickupLatitude: pickupLatitude ?? this.pickupLatitude,
      pickupLongitude: pickupLongitude ?? this.pickupLongitude,
      deliveryLatitude: deliveryLatitude ?? this.deliveryLatitude,
      deliveryLongitude: deliveryLongitude ?? this.deliveryLongitude,
      amount: amount ?? this.amount,
      items: items ?? this.items,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      pickupOtp: pickupOtp ?? this.pickupOtp,
      deliveryOtp: deliveryOtp ?? this.deliveryOtp,
    );
  }
} 