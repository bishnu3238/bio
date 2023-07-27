List<ShippingModel> shippingFromJson(dynamic jsonData) =>
    List<ShippingModel>.from(
        jsonData['Data'].map((e) => ShippingModel.fromMap(e)));

class ShippingModel {
  final String id;
  final num min, max, charges;

//<editor-fold desc="Data Methods">

  const ShippingModel({
    required this.id,
    required this.min,
    required this.max,
    required this.charges,
  });

  ShippingModel copyWith({
    String? id,
    num? mai,
    num? max,
    num? charges,
  }) {
    return ShippingModel(
      id: id ?? this.id,
      min: mai ?? this.min,
      max: max ?? this.max,
      charges: charges ?? this.charges,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'min': min,
      'max': max,
      'charges': charges,
    };
  }

  factory ShippingModel.fromMap(Map<String, dynamic> map) {
    return ShippingModel(
      id: map['id'] as String,
      min: num.parse(map['min']),
      max: num.parse(map['max']),
      charges: num.parse(map['charges']),
    );
  }

//</editor-fold>
}
