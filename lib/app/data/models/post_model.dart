class PostResponse {
  List<Data>? data;
  bool? success;

  PostResponse({this.data, this.success});

  PostResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? age;
  String? address;
  String? image;

  Data({this.id, this.name, this.age, this.address, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}
