class AddTodos {
  AddTodos({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.data,
  });

  final int? code;
  final bool? success;
  final int? timestamp;
  final String? message;
  final Data? data;

  factory AddTodos.fromJson(Map<String, dynamic> json) {
    return AddTodos(
      code: json["code"],
      success: json["success"],
      timestamp: json["timestamp"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      isCompleted: json["is_completed"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "is_completed": isCompleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
