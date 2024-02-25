class AuthUser {
  final String id;
  final String email;
  AuthUser({
    required this.id,
    required this.email,
  });

  AuthUser copyWith({
    String? id,
    String? email,
  }) {
    return AuthUser(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      id: map['id'] as String,
      email: map['email'] as String,
    );
  }

  @override
  String toString() => 'AuthUser(id: $id, email: $email)';

  @override
  bool operator ==(covariant AuthUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}
