import 'dart:convert';

List<ActiveBooking> activeOrderListFromJson(
        List<dynamic> activeOrderListJson) =>
    List<ActiveBooking>.from(activeOrderListJson
        .map((activeOrderJson) => ActiveBooking.fromJson(activeOrderJson)));

// To parse this JSON data, do
//
//     final activeBooking = activeBookingFromJson(jsonString);

ActiveBooking activeBookingFromJson(String str) =>
    ActiveBooking.fromJson(json.decode(str));

String activeBookingToJson(ActiveBooking data) => json.encode(data.toJson());

class ActiveBooking {
  ActiveBooking({
    required this.id,
    required this.serviceProviderId,
    required this.userId,
    required this.orderAddressId,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceProvider,
  });

  int id;
  int serviceProviderId;
  int userId;
  int orderAddressId;
  int price;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  ServiceProvider serviceProvider;

  factory ActiveBooking.fromJson(Map<String, dynamic> json) => ActiveBooking(
        id: json["id"],
        serviceProviderId: json["service_provider_id"],
        userId: json["user_id"],
        orderAddressId: json["order_address_id"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        serviceProvider: ServiceProvider.fromJson(json["service_provider"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_provider_id": serviceProviderId,
        "user_id": userId,
        "order_address_id": orderAddressId,
        "price": price,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "service_provider": serviceProvider.toJson(),
      };
}

class ServiceProvider {
  ServiceProvider({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    this.emailVerifiedAt,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImage,
    required this.media,
  });

  int id;
  String name;
  String phoneNumber;
  String email;
  dynamic emailVerifiedAt;
  String isAdmin;
  DateTime createdAt;
  DateTime updatedAt;
  String profileImage;
  List<Media> media;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isAdmin: json["is_admin"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        profileImage: json["profile_image"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "is_admin": isAdmin,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "profile_image": profileImage,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
  });

  int id;
  String modelType;
  int modelId;
  String uuid;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  String conversionsDisk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  GeneratedConversions generatedConversions;
  List<dynamic> responsiveImages;
  int orderColumn;
  DateTime createdAt;
  DateTime updatedAt;
  String originalUrl;
  String previewUrl;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        uuid: json["uuid"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        conversionsDisk: json["conversions_disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties:
            List<dynamic>.from(json["custom_properties"].map((x) => x)),
        generatedConversions:
            GeneratedConversions.fromJson(json["generated_conversions"]),
        responsiveImages:
            List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        originalUrl: json["original_url"],
        previewUrl: json["preview_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "conversions_disk": conversionsDisk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": List<dynamic>.from(customProperties.map((x) => x)),
        "generated_conversions": generatedConversions.toJson(),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "original_url": originalUrl,
        "preview_url": previewUrl,
      };
}

class GeneratedConversions {
  GeneratedConversions({
    required this.thumb,
    required this.medium,
  });

  bool thumb;
  bool medium;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) =>
      GeneratedConversions(
        thumb: json["thumb"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "medium": medium,
      };
}
