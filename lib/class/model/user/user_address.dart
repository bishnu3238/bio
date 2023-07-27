// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import '../../../methods/static_methods.dart';
import '../../enums.dart';

List<Address> addressFormJson(dynamic jsonData) =>
    List<Address>.from(jsonData['address'].map((e) => Address.fromMap(e)));

class Address {
  final String id,
      name,
      pincode_id,
      state,
      city,
      delivery_add,
      mobile_no,
      user_id;
  final String? add_type, landmark, location_id;

  final String status;
  DateTime date, time;
  final AddressType? addressType;
  bool defaultAddress;

//<editor-fold desc="Data Methods">
  Address({
    required this.id,
    required this.name,
    required this.pincode_id,
    required this.state,
    required this.city,
    required this.delivery_add,
    required this.mobile_no,
    required this.user_id,
    this.add_type,
    this.landmark,
    this.location_id,
    required this.status,
    required this.date,
    required this.time,
    this.addressType = AddressType.Home,
    this.defaultAddress = false,
  });

  @override
  String toString() {
    return 'Address{ id: $id, add_type: $add_type, pincode_id: $pincode_id, state: $state, city: $city, delivery_add: $delivery_add, mobile_no: $mobile_no, user_id: $user_id, landmark: $landmark, location_id: $location_id, status: $status, date: $date, time: $time, addressType: $addressType, defaultAddress: $defaultAddress,}';
  }

  Address copyWith({
    String? id,
    String? add_type,
    String? name,
    String? pincode_id,
    String? state,
    String? city,
    String? delivery_add,
    String? mobile_no,
    String? user_id,
    String? landmark,
    String? location_id,
    String? status,
    DateTime? date,
    DateTime? time,
    AddressType? addressType,
    bool? defaultAddress,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      add_type: add_type ?? this.add_type,
      pincode_id: pincode_id ?? this.pincode_id,
      state: state ?? this.state,
      city: city ?? this.city,
      delivery_add: delivery_add ?? this.delivery_add,
      mobile_no: mobile_no ?? this.mobile_no,
      user_id: user_id ?? this.user_id,
      landmark: landmark ?? this.landmark,
      location_id: location_id ?? this.location_id,
      status: status ?? this.status,
      date: date ?? this.date,
      time: time ?? this.time,
      addressType: addressType ?? this.addressType,
      defaultAddress: defaultAddress ?? this.defaultAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'add_type': add_type,
      'name': name,
      'pincode_id': pincode_id,
      'state': state,
      'city': city,
      'delivery_add': delivery_add,
      'mobile_no': mobile_no,
      'user_id': user_id,
      'landmark': landmark,
      'location_id': location_id,
      'status': status,
      'date': date,
      'time': time,
      'addressType': addressType,
      'defaultAddress': defaultAddress,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    log(map.runtimeType.toString());
    return Address(
      id: map['id'] as String,
      name: map['name'] as String,
      add_type: map['add_type'] as String,
      pincode_id: map['pincode_id'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
      delivery_add: map['delivery_add'] as String,
      mobile_no: map['mobile_no'] as String,
      user_id: map['user_id'] as String,
      landmark: map['landmark'],
      location_id: map['location_id'],
      status: map['status'] as String,
      date: DateTime.parse(map['date']),
      time: convertTime(map['time']),
      addressType: AddressType.Home,
      defaultAddress:false,
    );
  }

//</editor-fold>
}
