import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    required this.status,
    required this.group,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  String? gender;
  String? dateOfBirth;
  String? phone;
  int status;
  Group group;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        status: json["status"],
        group: Group.fromJson(json["group"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "status": status,
        "group": group.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Group {
  Group({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
