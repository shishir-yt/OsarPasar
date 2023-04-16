List<NotificationServiceprovider> notificationListFromJson(List<dynamic> notificationListJson) =>
    List<NotificationServiceprovider>.from(notificationListJson
        .map((notificationJson) => NotificationServiceprovider.fromJson(notificationJson)));

class NotificationServiceprovider {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  NotificationServiceprovider(
      {this.id,
      this.type,
      this.notifiableType,
      this.notifiableId,
      this.data,
      this.readAt,
      this.createdAt,
      this.updatedAt});

  NotificationServiceprovider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['notifiable_type'] = notifiableType;
    data['notifiable_id'] = notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Data {
  int? serviceProviderId;
  int? orderId;
  String? serviceProviderName;
  String? note;

  Data(
      {this.serviceProviderId,
      this.orderId,
      this.serviceProviderName,
      this.note});

  Data.fromJson(Map<String, dynamic> json) {
    serviceProviderId = json['service_provider_id'];
    orderId = json['order_id'];
    serviceProviderName = json['service_provider_name'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_provider_id'] = serviceProviderId;
    data['order_id'] = orderId;
    data['service_provider_name'] = serviceProviderName;
    data['note'] = note;
    return data;
  }
}