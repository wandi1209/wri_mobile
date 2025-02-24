class GetTodosResponse {
  GetTodosResponse({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });

  final int? code;
  final bool? success;
  final int? timestamp;
  final String? message;
  final List<Item> items;
  final Meta? meta;

  factory GetTodosResponse.fromJson(Map<String, dynamic> json) {
    return GetTodosResponse(
      code: json["code"],
      success: json["success"],
      timestamp: json["timestamp"],
      message: json["message"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "items": items.map((x) => x?.toJson()).toList(),
        "meta": meta?.toJson(),
      };
}

class Item {
  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
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

class Meta {
  Meta({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });

  final int? totalItems;
  final int? totalPages;
  final int? perPageItem;
  final int? currentPage;
  final int? pageSize;
  final bool? hasMorePage;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      totalItems: json["total_items"],
      totalPages: json["total_pages"],
      perPageItem: json["per_page_item"],
      currentPage: json["current_page"],
      pageSize: json["page_size"],
      hasMorePage: json["has_more_page"],
    );
  }

  Map<String, dynamic> toJson() => {
        "total_items": totalItems,
        "total_pages": totalPages,
        "per_page_item": perPageItem,
        "current_page": currentPage,
        "page_size": pageSize,
        "has_more_page": hasMorePage,
      };
}
