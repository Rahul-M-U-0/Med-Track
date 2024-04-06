import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  final String buyerId;
  final String shopId;
  final String productId;
  final Timestamp timestamp;
  final bool delivered;

  Medicine({
    required this.buyerId,
    required this.shopId,
    required this.productId,
    required this.timestamp,
    required this.delivered,
  });

  //convert to map
  Map<String, dynamic> toMap() {
    return {
      'buyerId': buyerId,
      'shopId': shopId,
      'productId': productId,
      'timestamp': timestamp,
      'delivered': delivered,
    };
  }
}
