import 'dart:convert';

class CategoryResModel {
  String? status;
  String? message;
  List<DataCategory>? data;

  CategoryResModel({
    this.status,
    this.message,
    this.data,
  });

  CategoryResModel copyWith({
    String? status,
    String? message,
    List<DataCategory>? data,
  }) =>
      CategoryResModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CategoryResModel.fromJson(String str) =>
      CategoryResModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResModel.fromMap(Map<String, dynamic> json) =>
      CategoryResModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataCategory>.from(
                json["data"]!.map((x) => DataCategory.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DataCategory {
  int? id;
  String? categoryName;
  int? active;
  dynamic createdAt;
  dynamic updatedAt;

  DataCategory({
    this.id,
    this.categoryName,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  DataCategory copyWith({
    int? id,
    String? categoryName,
    int? active,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      DataCategory(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DataCategory.fromJson(String str) =>
      DataCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCategory.fromMap(Map<String, dynamic> json) => DataCategory(
        id: json["id"],
        categoryName: json["category_name"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_name": categoryName,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
