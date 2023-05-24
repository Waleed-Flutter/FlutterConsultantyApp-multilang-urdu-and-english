class Model1 {
  List<Data> data;
  String status;
  int code;
  String message;

  Model1({this.data, this.status, this.code, this.message});

  Model1.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List)
      this.data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    if (json["status"] is String) this.status = json["status"];
    if (json["code"] is int) this.code = json["code"];
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data.map((e) => e.toJson()).toList();
    data["status"] = this.status;
    data["code"] = this.code;
    data["message"] = this.message;
    return data;
  }
}

class Data {
  int id;
  List<Attachments> attachments;
  String name;
  String status;
  String desc;
  String created;
  String updated;
  int addedby;

  Data(
      {this.id,
      this.attachments,
      this.name,
      this.status,
      this.desc,
      this.created,
      this.updated,
      this.addedby});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["attachments"] is List)
      this.attachments = json["attachments"] == null
          ? null
          : (json["attachments"] as List)
              .map((e) => Attachments.fromJson(e))
              .toList();
    if (json["name"] is String) this.name = json["name"];
    if (json["status"] is String) this.status = json["status"];
    if (json["desc"] is String) this.desc = json["desc"];
    if (json["created"] is String) this.created = json["created"];
    if (json["updated"] is String) this.updated = json["updated"];
    if (json["addedby"] is int) this.addedby = json["addedby"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    if (this.attachments != null)
      data["attachments"] = this.attachments.map((e) => e.toJson()).toList();
    data["name"] = this.name;
    data["status"] = this.status;
    data["desc"] = this.desc;
    data["created"] = this.created;
    data["updated"] = this.updated;
    data["addedby"] = this.addedby;
    return data;
  }
}

class Attachments {
  int id;
  String name;
  String desc;
  String created;
  String updated;
  int serv;

  Attachments(
      {this.id, this.name, this.desc, this.created, this.updated, this.serv});

  Attachments.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["desc"] is String) this.desc = json["desc"];
    if (json["created"] is String) this.created = json["created"];
    if (json["updated"] is String) this.updated = json["updated"];
    if (json["serv"] is int) this.serv = json["serv"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["desc"] = this.desc;
    data["created"] = this.created;
    data["updated"] = this.updated;
    data["serv"] = this.serv;
    return data;
  }
}
