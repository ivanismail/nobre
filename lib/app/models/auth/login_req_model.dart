class LoginReqModel {
  String? phoneNumber;
  String? password;
  String? fcmToken;

  LoginReqModel({this.phoneNumber, this.password, this.fcmToken});

  LoginReqModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
