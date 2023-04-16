List<CategoryItem> categoryListFromJson(List<dynamic> categoryListJson) =>
    List<CategoryItem>.from(categoryListJson
        .map((categoryJson) => CategoryItem.fromJson(categoryJson)));

class CategoryItem {
  int? id;
  int? serviceProviderId;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;

  CategoryItem(
      {this.id,
      this.serviceProviderId,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.items});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_provider_id'] = serviceProviderId;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? serviceProviderId;
  int? categoryId;
  String? name;
  int itemCount = 1;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.serviceProviderId,
      this.categoryId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.itemCount = 1,
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    categoryId = json['category_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_provider_id'] = serviceProviderId;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
