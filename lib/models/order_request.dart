List<OrderRequest> orderRequestListFromJson(List<dynamic> orderRequestListJson) =>
    List<OrderRequest>.from(orderRequestListJson
        .map((orderRequestJson) => OrderRequest.fromJson(orderRequestJson)));

class OrderRequest {
  int? id;
  int? serviceProviderId;
  int? userId;
  int? orderAddressId;
  String? status;
  String? createdAt;
  String? updatedAt;
  ServiceProvider? serviceProvider;

  OrderRequest(
      {this.id,
      this.serviceProviderId,
      this.userId,
      this.orderAddressId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.serviceProvider});

  OrderRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    userId = json['user_id'];
    orderAddressId = json['order_address_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serviceProvider = json['service_provider'] != null
        ? ServiceProvider.fromJson(json['service_provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_provider_id'] = serviceProviderId;
    data['user_id'] = userId;
    data['order_address_id'] = orderAddressId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (serviceProvider != null) {
      data['service_provider'] = serviceProvider!.toJson();
    }
    return data;
  }
}

class ServiceProvider {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? isAdmin;
  String? createdAt;
  String? updatedAt;
  String? profileImage;

  ServiceProvider({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
  });

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image'] = profileImage;
    return data;
  }
}
