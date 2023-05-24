class Spacecraft {
  final List<Datum> data;
  final String status;
  final int code;
  final String message;

  Spacecraft({
    this.data,
    this.status,
    this.code,
    this.message,
  });

  factory Spacecraft.fromJson(Map<String, dynamic> json) {
    return Spacecraft(
      data: json['data'],
      status: json['status'],
      code: json['code'],
      message: json['message'],
    );
  }
}

class Datum {
  final int id;
  final List<Attachment> attachments;
  final String name;
  final String status;
  final String desc;
  final DateTime created;
  final DateTime updated;
  final int addedby;

  Datum({
    this.id,
    this.attachments,
    this.name,
    this.status,
    this.desc,
    this.created,
    this.updated,
    this.addedby,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      attachments: json['attachments'],
      name: json['name'],
      status: json['status'],
      desc: json['desc'],
      created: json['created'],
      updated: json['updated'],
      addedby: json['addedby'],
    );
  }
}

class Attachment {
  final int id;
  final String name;
  final String desc;
  final DateTime created;
  final DateTime updated;
  final int serv;

  Attachment({
    this.id,
    this.name,
    this.desc,
    this.created,
    this.updated,
    this.serv,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      created: json['created'],
      updated: json['updated'],
      serv: json['serv'],
    );
  }
}

class Product {
  final int id;
  final String name;
  final List<Image> images;

  Product({this.id, this.name, this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(
        id: parsedJson['id'],
        name: parsedJson['name'],
        images: parsedJson['images']);
  }
}

class Image {
  final int imageId;
  final String imageName;

  Image({this.imageId, this.imageName});

  factory Image.fromJson(Map<String, dynamic> parsedJson) {
    return Image(imageId: parsedJson['id'], imageName: parsedJson['imageName']);
  }
}
