import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final String email;
  final String? displayName;
  final String? phoneNumber;
  final String? photoURL;

  AuthUser({
    required this.id,
    required this.email,
    this.displayName,
    this.phoneNumber,
    this.photoURL,
  });

  AuthUser copyWith({
    String? id,
    String? email,
    String? displayName,
    String? phoneNumber,
    String? photoURL,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName,
      phoneNumber: phoneNumber,
    );
  }

  factory AuthUser.fromFirebaseUser(User user) {
    return AuthUser(
      id: user.uid,
      email: user.email!,
      displayName: user.displayName,
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      id: map['id'] as String,
      email: map['email'] as String,
      displayName: map['displayName'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      photoURL: map['photoURL'] as String?,
    );
  }

  @override
  String toString() =>
      'AuthUser(id: $id, email: $email, displayName: $displayName, phoneNumber: $phoneNumber)';

  @override
  bool operator ==(covariant AuthUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.displayName == displayName &&
        other.phoneNumber == phoneNumber &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      displayName.hashCode ^
      phoneNumber.hashCode ^
      photoURL.hashCode;
}
