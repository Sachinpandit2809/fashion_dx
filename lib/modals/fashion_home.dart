// class FashionHomeModel {
//   List<FashionData>? fashionData;

//   FashionHomeModel({this.fashionData});

//   FashionHomeModel.fromJson(Map<String, dynamic> json) {
//     if (json['fashionData'] != null) {
//       fashionData = <FashionData>[];
//       json['fashionData'].forEach((v) {
//         fashionData!.add(new FashionData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.fashionData != null) {
//       data['fashionData'] = this.fashionData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class FashionData {
//   String? image;
//   String? title;
//   String? description;
//   String? price;

//   FashionData({this.image, this.title, this.description, this.price});

//   FashionData.fromJson(Map<String, dynamic> json) {
//     image = json['image'];
//     title = json['title'];
//     description = json['description'];
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['image'] = this.image;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     return data;
//   }
// }

class FashionHomeModel {
  List<FashionData>? fashionData;

  FashionHomeModel({this.fashionData});

  FashionHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['fashionData'] != null) {
      fashionData = <FashionData>[];
      json['fashionData'].forEach((v) {
        fashionData!.add(new FashionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fashionData != null) {
      data['fashionData'] = this.fashionData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FashionData {
  String? sId;
  String? title;
  String? description;
  String? price;
  String? image;
  int? iV;

  FashionData(
      {this.sId,
      this.title,
      this.description,
      this.price,
      this.image,
      this.iV});

  FashionData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
