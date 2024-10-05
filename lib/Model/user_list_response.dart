class UserListResponse {
  final String? message;
  final List<UserDataModel>? data;

  UserListResponse({this.message, this.data});

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
        message: json['message'],
        data: (json['data'] as List)
            .map((e) => UserDataModel.fromJson(e))
            .toList());
  }
}

class UserDataModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final UserDataType? userDataType;
  final String? createdAt;
  final String? updatedAt;

  UserDataModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.userDataType,
      this.createdAt,
      this.updatedAt});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userDataType: UserDataType.fromJson(json['userType']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class UserDataType {
  final String? id;
  final String? name;

  UserDataType({this.id, this.name});

  factory UserDataType.fromJson(Map<String, dynamic> json) {
    return UserDataType(id: json['_id'], name: json['name']);
  }
}
