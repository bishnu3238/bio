List<OrderItemModel> orderItemsModelFromJson(dynamic jsonData) =>
    List<OrderItemModel>.from(jsonData.map((e) => OrderItemModel.fromMap(e)));

class OrderItemModel {
  final String id;
  final String orderId;
  final String iip;
  final String paymentMethodId;
  final String productId;
  final String productName;
  final String menuType;
  final String categoryName;
  final String subcategoryName;
  final int quantity;
  final double price;
  final double totalPrice;
  final String dateTime;
  final String status;
  final String deliveryAddressId;
  final double pay;
  final String userId;
  final String sessionId;
  final String date;
  final String modified;
  final String delivered;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['order_id'],
      iip: json['iip'],
      paymentMethodId: json['payment_method_id'],
      productId: json['pro_id'],
      productName: json['product_name'],
      menuType: json['menu_type'],
      categoryName: json['category_name'],
      subcategoryName: json['subcategory_name'],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['tot_price'],
      dateTime: json['date_time'],
      status: json['status'],
      deliveryAddressId: json['delivery_add_id'],
      pay: json['pay'],
      userId: json['user_id'],
      sessionId: json['session_id'],
      date: json['date'],
      modified: json['modified'],
      delivered: json['delivered'],
    );
  }

//<editor-fold desc="Data Methods">
  const OrderItemModel({
    required this.id,
    required this.orderId,
    required this.iip,
    required this.paymentMethodId,
    required this.productId,
    required this.productName,
    required this.menuType,
    required this.categoryName,
    required this.subcategoryName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.dateTime,
    required this.status,
    required this.deliveryAddressId,
    required this.pay,
    required this.userId,
    required this.sessionId,
    required this.date,
    required this.modified,
    required this.delivered,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          orderId == other.orderId &&
          iip == other.iip &&
          paymentMethodId == other.paymentMethodId &&
          productId == other.productId &&
          productName == other.productName &&
          menuType == other.menuType &&
          categoryName == other.categoryName &&
          subcategoryName == other.subcategoryName &&
          quantity == other.quantity &&
          price == other.price &&
          totalPrice == other.totalPrice &&
          dateTime == other.dateTime &&
          status == other.status &&
          deliveryAddressId == other.deliveryAddressId &&
          pay == other.pay &&
          userId == other.userId &&
          sessionId == other.sessionId &&
          date == other.date &&
          modified == other.modified &&
          delivered == other.delivered);

  @override
  int get hashCode =>
      id.hashCode ^
      orderId.hashCode ^
      iip.hashCode ^
      paymentMethodId.hashCode ^
      productId.hashCode ^
      productName.hashCode ^
      menuType.hashCode ^
      categoryName.hashCode ^
      subcategoryName.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      totalPrice.hashCode ^
      dateTime.hashCode ^
      status.hashCode ^
      deliveryAddressId.hashCode ^
      pay.hashCode ^
      userId.hashCode ^
      sessionId.hashCode ^
      date.hashCode ^
      modified.hashCode ^
      delivered.hashCode;

  @override
  String toString() {
    return 'OrderItemModel{ id: $id, orderId: $orderId, iip: $iip, paymentMethodId: $paymentMethodId, productId: $productId, productName: $productName, menuType: $menuType, categoryName: $categoryName, subcategoryName: $subcategoryName, quantity: $quantity, price: $price, totalPrice: $totalPrice, dateTime: $dateTime, status: $status, deliveryAddressId: $deliveryAddressId, pay: $pay, userId: $userId, sessionId: $sessionId, date: $date, modified: $modified, delivered: $delivered,}';
  }

  OrderItemModel copyWith({
    String? id,
    String? orderId,
    String? iip,
    String? paymentMethodId,
    String? productId,
    String? productName,
    String? menuType,
    String? categoryName,
    String? subcategoryName,
    int? quantity,
    double? price,
    double? totalPrice,
    String? dateTime,
    String? status,
    String? deliveryAddressId,
    double? pay,
    String? userId,
    String? sessionId,
    String? date,
    String? modified,
    String? delivered,
  }) {
    return OrderItemModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      iip: iip ?? this.iip,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      menuType: menuType ?? this.menuType,
      categoryName: categoryName ?? this.categoryName,
      subcategoryName: subcategoryName ?? this.subcategoryName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      totalPrice: totalPrice ?? this.totalPrice,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      pay: pay ?? this.pay,
      userId: userId ?? this.userId,
      sessionId: sessionId ?? this.sessionId,
      date: date ?? this.date,
      modified: modified ?? this.modified,
      delivered: delivered ?? this.delivered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'orderId': orderId,
      'iip': iip,
      'paymentMethodId': paymentMethodId,
      'productId': productId,
      'productName': productName,
      'menuType': menuType,
      'categoryName': categoryName,
      'subcategoryName': subcategoryName,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
      'dateTime': dateTime,
      'status': status,
      'deliveryAddressId': deliveryAddressId,
      'pay': pay,
      'userId': userId,
      'sessionId': sessionId,
      'date': date,
      'modified': modified,
      'delivered': delivered,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      id: map['id'].toString(),
      orderId: map['order_id'].toString(),
      iip: map['iip'].toString(),
      paymentMethodId: map['payment_method_id'].toString(),
      productId: map['pro_id'].toString(),
      productName: map['product_name'].toString(),
      menuType: map['menu_type'].toString(),
      categoryName: map['category_name'].toString(),
      subcategoryName: map['subcategory_name'].toString(),
      quantity: map['quantity'].runtimeType == int
          ? map['quantity']
          : int.parse(map['quantity']),
      price: map['price'].runtimeType == double
          ? map['price']
          : double.parse(map['price']),
      totalPrice: map['tot_price'].runtimeType == double
          ? map['tot_price']
          : double.parse(map['tot_price']),
      dateTime: map['date_time'].toString(),
      status: map['status'].toString(),
      deliveryAddressId: map['delivery_add_id'].toString(),
      pay: map['pay'].runtimeType == double
          ? map['pay']
          : double.parse(map['pay']),
      userId: map['user_id'].toString(),
      sessionId: map['session_Id'].toString(),
      date: map['date'].toString(),
      modified: map['modified'].toString(),
      delivered: map['delivered'] ?? "",
    );
  }

//</editor-fold>
}
