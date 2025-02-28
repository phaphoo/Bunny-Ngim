class AuthModel {
  String? fcmToken;
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? image;

  AuthModel({this.fcmToken, this.uid, this.email, this.mobile, this.name});

  AuthModel.fromJson(Map<String, dynamic> json) {
    fcmToken = json['fcm_token'];
    uid = json['uid'];
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fcm_token'] = fcmToken;
    data['uid'] = uid;
    data['email'] = email;
    data['mobile'] = mobile;
    data['name'] = name;
    data['image'] = image;

    return data;
  }
}
