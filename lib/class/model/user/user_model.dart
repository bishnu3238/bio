// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/cupertino.dart';
import 'package:universal_lab/methods/static_methods.dart';
import 'package:equatable/equatable.dart';

class User extends ChangeNotifier {
  late String uid;

  late String name;

  late String email;

  late String photoURL;

  late String phoneNO;

  late String id;

  //<editor-fold desc="Data Methods">
  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoURL,
    required this.phoneNO,
    required this.id,
  });

  User copyWith({
    String? uid,
    String? id,
    String? email,
    String? name,
    String? photoURL,
    String? phoneNO,
  }) {
    return User(
      uid: uid ?? this.uid,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      phoneNO: phoneNO ?? this.phoneNO,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoURL': photoURL,
      'phoneNO': phoneNO,
    };
  }

  factory User.fromMap(Map<String, dynamic>? map) {
    return User(
      uid: map == null ? "" : map['uid'] as String,
      id: map == null ? "" : map['id'] as String,
      email: map == null ? "" : map['email'] as String,
      name: map == null ? "" : map['name'] as String,
      photoURL: map == null ? "" : map['photoURL'] as String,
      phoneNO: map == null ? "" : map['phoneNO'] as String,
    );
  }

  factory User.fromFirebase(u.User user) {
    return User(
      uid: user.uid,
      id: "",
      email: user.email ?? "",
      name: user.displayName ?? "",
      photoURL: user.photoURL ?? "",
      phoneNO: user.phoneNumber ?? "",
    );
  }

//</editor-fold>
}

class UserModel extends Equatable {
  final String id, name, mobile_no, password, job_role, referal_code, status;
  final String? email, referal_by, image, gender;
  final DateTime date, time;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.id,
    required this.name,
    required this.mobile_no,
    required this.password,
    required this.job_role,
    required this.referal_code,
    required this.status,
    this.email,
    this.referal_by,
    this.image,
    this.gender,
    required this.date,
    required this.time,
  });

  @override
  String toString() {
    return 'UserModel{ id: $id, name: $name, mobile_no: $mobile_no, password: $password, job_role: $job_role, referal_code: $referal_code, status: $status, email: $email, referal_by: $referal_by, image: $image, gender: $gender, data: $date, time: $time,}';
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? mobile_no,
    String? password,
    String? job_role,
    String? referal_code,
    String? status,
    String? email,
    String? referal_by,
    String? image,
    String? gender,
    DateTime? date,
    DateTime? time,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      mobile_no: mobile_no ?? this.mobile_no,
      password: password ?? this.password,
      job_role: job_role ?? this.job_role,
      referal_code: referal_code ?? this.referal_code,
      status: status ?? this.status,
      email: email ?? this.email,
      referal_by: referal_by ?? this.referal_by,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobile_no': mobile_no,
      'password': password,
      'job_role': job_role,
      'referal_code': referal_code,
      'status': status,
      'email': email,
      'referal_by': referal_by,
      'image': image,
      'gender': gender,
      'date': date.toString(),
      'time': time.toString(),
    };
  }

  factory UserModel.empty() => UserModel(
      id: '',
      name: '',
      mobile_no: '',
      password: '',
      job_role: '',
      referal_code: '',
      status: '',
      date: DateTime(2023, 07, 05),
      time: DateTime.now());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      mobile_no: map['mobile_no'] as String,
      password: map['password'] as String,
      job_role: map['job_role'] as String,
      referal_code: map['referal_code'] as String,
      status: map['status'] as String,
      email: map['email'],
      referal_by: map['referal_by'],
      image: map['image'],
      gender: map['gender'],
      date: convertDate(map['date']),
      time: convertTime(map['time']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        mobile_no,
        password,
        job_role,
        referal_code,
        status,
        email,
        referal_by,
        image,
        gender,
        date,
        time
      ];

//</editor-fold>
}
