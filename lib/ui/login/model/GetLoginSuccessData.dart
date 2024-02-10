class GetLoginSuccessData {
  List<LoginItem>? documents;

  GetLoginSuccessData({this.documents});

  GetLoginSuccessData.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <LoginItem>[];
      json['documents'].forEach((v) {
        documents!.add(new LoginItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoginItem {
  String? sId;
  String? name;
  String? image;
  String? email;
  String? password;

  LoginItem({this.sId, this.name, this.image, this.email, this.password});

  LoginItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
