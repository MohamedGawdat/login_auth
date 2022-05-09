import 'dart:convert';

class User {
  String? createdAt;
  String? name;
  String? avatar;
  String? email;
  String? id;

  User({
    this.createdAt,
    this.name,
    this.avatar,
    this.email,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['email'] = email;
    data['avatar_'] = avatar;
    data['id'] = id;
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
