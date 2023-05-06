class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? isAdmin;
  String? profileImage;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.emailVerifiedAt,
      this.isAdmin,
      this.profileImage,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    data['profile_image'] = profileImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
