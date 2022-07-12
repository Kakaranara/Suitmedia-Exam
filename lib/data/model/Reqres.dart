// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reqres {
  final int id;
  final String? email;
  final String? first_name;
  final String? last_name;
  final String? avatar;
  Reqres({
    required this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  Reqres copyWith({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) {
    return Reqres(
      id: id ?? this.id,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    };
  }

  factory Reqres.fromMap(Map<String, dynamic> map) {
    return Reqres(
      id: map['id'] as int,
      email: map['email'] != null ? map['email'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reqres.fromJson(String source) =>
      Reqres.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reqres(id: $id, email: $email, first_name: $first_name, last_name: $last_name, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant Reqres other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        avatar.hashCode;
  }
}
