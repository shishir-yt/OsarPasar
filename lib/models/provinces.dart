import 'dart:convert';

List<NepalProvince> provinceFromJson(String str) => List<NepalProvince>.from(
    json.decode(str).map((x) => NepalProvince.fromJson(x)));

String provinceToJson(List<NepalProvince> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  District({
    required this.id,
    required this.name,
    required this.provinceId,
    this.createdAt,
    this.updatedAt,
    required this.cities,
  });

  int id;
  String name;
  int provinceId;
  String? createdAt;
  String? updatedAt;
  List<Cities> cities;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        provinceId: json["province_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        cities:
            List<Cities>.from(json["cities"].map((x) => Cities.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "province_id": provinceId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class NepalProvince {
  NepalProvince({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    required this.districts,
    this.districtId,
  });

  int id;
  String name;
  String? createdAt;
  String? updatedAt;
  List<District> districts = [];
  int? districtId;

  factory NepalProvince.fromJson(Map<String, dynamic> json) => NepalProvince(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        districts: json["districts"] == null
            ? []
            : List<District>.from(
                json["districts"]!.map((x) => District.fromJson(x))),
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "districts": districts == null
            ? []
            : List<dynamic>.from(districts.map((x) => x.toJson())),
        "district_id": districtId,
      };
}

class Cities {
  Cities({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String? createdAt;
  String? updatedAt;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
