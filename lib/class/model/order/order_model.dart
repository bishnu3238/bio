import 'dart:developer';

import 'order_item_model.dart';

List<OrderModel> currentOrderFromJson(dynamic jsonData) =>
    List<OrderModel>.from(
        jsonData['orders'].map((e) => OrderModel.fromMap(e, jsonData)));

class OrderModel {
  final String id;
  final String orderId;
  final String userId;
  final String orderBy;
  final String sessionId;
  final String invoiceId;
  final String ipAddress;
  final int totalQty;
  final List<OrderItemModel> orderItems;
  final double totalPrice;
  final double shipping;
  final String billingAddress1;
  final String billingPhoneNo;
  final String shippingAddress1;
  final String shippingPhoneNo;
  final String paid;
  final bool isGenerated;
  final bool isConfirmed;
  final String date;
  final String modified;
  final String delivered;

//<editor-fold desc="Data Methods">
  const OrderModel({
    required this.id,
    required this.orderId,
    required this.userId,
    required this.orderBy,
    required this.sessionId,
    required this.invoiceId,
    required this.ipAddress,
    required this.totalQty,
    required this.orderItems,
    required this.totalPrice,
    required this.shipping,
    required this.billingAddress1,
    required this.billingPhoneNo,
    required this.shippingAddress1,
    required this.shippingPhoneNo,
    required this.paid,
    required this.isGenerated,
    required this.isConfirmed,
    required this.date,
    required this.modified,
    required this.delivered,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          orderId == other.orderId &&
          userId == other.userId &&
          orderBy == other.orderBy &&
          sessionId == other.sessionId &&
          invoiceId == other.invoiceId &&
          ipAddress == other.ipAddress &&
          totalQty == other.totalQty &&
          orderItems == other.orderItems &&
          totalPrice == other.totalPrice &&
          shipping == other.shipping &&
          billingAddress1 == other.billingAddress1 &&
          billingPhoneNo == other.billingPhoneNo &&
          shippingAddress1 == other.shippingAddress1 &&
          shippingPhoneNo == other.shippingPhoneNo &&
          paid == other.paid &&
          isGenerated == other.isGenerated &&
          isConfirmed == other.isConfirmed &&
          date == other.date &&
          modified == other.modified &&
          delivered == other.delivered);

  @override
  int get hashCode =>
      id.hashCode ^
      orderId.hashCode ^
      userId.hashCode ^
      orderBy.hashCode ^
      sessionId.hashCode ^
      invoiceId.hashCode ^
      ipAddress.hashCode ^
      totalQty.hashCode ^
      orderItems.hashCode ^
      totalPrice.hashCode ^
      shipping.hashCode ^
      billingAddress1.hashCode ^
      billingPhoneNo.hashCode ^
      shippingAddress1.hashCode ^
      shippingPhoneNo.hashCode ^
      paid.hashCode ^
      isGenerated.hashCode ^
      isConfirmed.hashCode ^
      date.hashCode ^
      modified.hashCode ^
      delivered.hashCode;

  @override
  String toString() {
    return 'OrderModel{ id: $id, orderId: $orderId, userId: $userId, orderBy: $orderBy, sessionId: $sessionId, invoiceId: $invoiceId, ipAddress: $ipAddress, totalQty: $totalQty, orderItems: $orderItems, totalPrice: $totalPrice, shipping: $shipping, billingAddress1: $billingAddress1, billingPhoneNo: $billingPhoneNo, shippingAddress1: $shippingAddress1, shippingPhoneNo: $shippingPhoneNo, paid: $paid, isGenerated: $isGenerated, isConfirmed: $isConfirmed, date: $date, modified: $modified, delivered: $delivered,}';
  }

  OrderModel copyWith({
    String? id,
    String? orderId,
    String? userId,
    String? orderBy,
    String? sessionId,
    String? invoiceId,
    String? ipAddress,
    int? totalQty,
    List<OrderItemModel>? orderItems,
    double? totalPrice,
    double? shipping,
    String? billingAddress1,
    String? billingPhoneNo,
    String? shippingAddress1,
    String? shippingPhoneNo,
    String? paid,
    bool? isGenerated,
    bool? isConfirmed,
    String? date,
    String? modified,
    String? delivered,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      orderBy: orderBy ?? this.orderBy,
      sessionId: sessionId ?? this.sessionId,
      invoiceId: invoiceId ?? this.invoiceId,
      ipAddress: ipAddress ?? this.ipAddress,
      totalQty: totalQty ?? this.totalQty,
      orderItems: orderItems ?? this.orderItems,
      totalPrice: totalPrice ?? this.totalPrice,
      shipping: shipping ?? this.shipping,
      billingAddress1: billingAddress1 ?? this.billingAddress1,
      billingPhoneNo: billingPhoneNo ?? this.billingPhoneNo,
      shippingAddress1: shippingAddress1 ?? this.shippingAddress1,
      shippingPhoneNo: shippingPhoneNo ?? this.shippingPhoneNo,
      paid: paid ?? this.paid,
      isGenerated: isGenerated ?? this.isGenerated,
      isConfirmed: isConfirmed ?? this.isConfirmed,
      date: date ?? this.date,
      modified: modified ?? this.modified,
      delivered: delivered ?? this.delivered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'userId': userId,
      'orderBy': orderBy,
      'sessionId': sessionId,
      'invoiceId': invoiceId,
      'ipAddress': ipAddress,
      'totalQty': totalQty,
      'orderItems': orderItems,
      'totalPrice': totalPrice,
      'shipping': shipping,
      'billingAddress1': billingAddress1,
      'billingPhoneNo': billingPhoneNo,
      'shippingAddress1': shippingAddress1,
      'shippingPhoneNo': shippingPhoneNo,
      'paid': paid,
      'isGenerated': isGenerated,
      'isConfirmed': isConfirmed,
      'date': date,
      'modified': modified,
      'delivered': delivered,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> json, jsonData) {
    var map = json['order'];

    log("+++++++++++++++++++++++");
    log(map.toString());
    log("+*************************************+");
    log(json['orderDetails'].runtimeType.toString());
    log(json['orderDetails'].toString());
    log("+*************************************+");

    return OrderModel(
      id: map['id'].toString(),
      orderId: map['order_id'].toString(),
      userId: map['user_id'].toString(),
      orderBy: map['order_by'].toString(),
      sessionId: map['session_id'].toString(),
      invoiceId: map['invoice_id'].toString(),
      ipAddress: map['ip_address'].toString(),
      totalQty: map['total_qty'].runtimeType == int
          ? map['total_qty']
          : int.parse(map['total_qty']),
      orderItems: orderItemsModelFromJson(json['orderDetails']), // todo:
      totalPrice: map['total_price'].runtimeType == double
          ? map['total_price']
          : double.parse(map['total_price']),
      shipping: map['shipping'].runtimeType == double
          ? map['shipping']
          : double.parse(map['shipping']),
      billingAddress1: map['billing_address1'].toString(),
      billingPhoneNo: map['billing_phone_no'].toString(),
      shippingAddress1: map['shipping_address1'].toString(),
      shippingPhoneNo: map['shipping_phone_no'].toString(),
      paid: map['paid'].toString(),
      isGenerated: map['is_generated'] == '0' ? false : true,
      isConfirmed: map['is_confirmed'] == '0' ? false : true,
      date: map['date'].toString(),
      modified: map['modified'].toString(),
      delivered: map['delivered'].toString(),
    );
  }

//</editor-fold>
}
