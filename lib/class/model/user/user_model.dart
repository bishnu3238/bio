import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
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

  //<editor-fold desc="Data Methods">
  User({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoURL,
  });

  User copyWith({
    String? uid,
    String? email,
    String? name,
    String? photoURL,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'photoURL': photoURL,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      photoURL: map['photoURL'] as String,
    );
  }

//</editor-fold>
}
