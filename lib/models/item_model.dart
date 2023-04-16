class item_model {
  List<ItemId>? itemId;
  int? serviceProviderId;
  String? pickupAddress;
  String? destinationAddress;
  String? pickupDate;
  String? pickupTime;

  item_model(
      {this.itemId,
      this.serviceProviderId,
      this.pickupAddress,
      this.destinationAddress,
      this.pickupDate,
      this.pickupTime});

  item_model.fromJson(Map<String, dynamic> json) {
    if (json['item_id'] != null) {
      itemId = <ItemId>[];
      json['item_id'].forEach((v) {
        itemId!.add(new ItemId.fromJson(v));
      });
    }
    serviceProviderId = json['service_provider_id'];
    pickupAddress = json['pickup_address'];
    destinationAddress = json['destination_address'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemId != null) {
      data['item_id'] = this.itemId!.map((v) => v.toJson()).toList();
    }
    data['service_provider_id'] = this.serviceProviderId;
    data['pickup_address'] = this.pickupAddress;
    data['destination_address'] = this.destinationAddress;
    data['pickup_date'] = this.pickupDate;
    data['pickup_time'] = this.pickupTime;
    return data;
  }
}

class ItemId {
  int? id;
  int? quantity;

  ItemId({this.id, this.quantity});

  ItemId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    return data;
  }
}
