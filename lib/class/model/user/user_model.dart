import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../enums.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject with ChangeNotifier {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String photoURL;

  @HiveField(4)
  late String phoneNO;

  //<editor-fold desc="Data Methods">
  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoURL,
    required this.phoneNO,
  });

  User copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoURL,
    String? phoneNO,
  }) {
    return User(
      uid: uid ?? this.uid,
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
      email: map == null ? "" : map['email'] as String,
      name: map == null ? "" : map['name'] as String,
      photoURL: map == null ? "" : map['photoURL'] as String,
      phoneNO: map == null ? "" : map['phoneNO'] as String,
    );
  }

  factory User.fromFirebase(u.User user) {
    return User(
      uid: user.uid,
      email: user.email ?? "",
      name: user.displayName ?? "",
      photoURL: user.photoURL ?? "",
      phoneNO: user.phoneNumber ?? "",
    );
  }

//</editor-fold>
}
