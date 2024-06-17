class Mission {
  String? uid;
  String? createUserUid;
  String? targetUserUid;
  String? contents;
  DateTime? expirationDate;
  int? exp;
  int? status;
  CreateUserU? createUserU;
  CreateUserU? targetUserU;

  Mission(
      {this.uid,
      this.createUserUid,
      this.targetUserUid,
      this.contents,
      this.expirationDate,
      this.exp,
      this.status,
      this.createUserU,
      this.targetUserU});

  Mission.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    createUserUid = json['createUserUid'];
    targetUserUid = json['targetUserUid'];
    contents = json['contents'];
    expirationDate = json['expirationDate'];
    exp = json['exp'];
    status = json['status'];
    createUserU = json['createUserU'] != null
        ? new CreateUserU.fromJson(json['createUserU'])
        : null;
    targetUserU = json['targetUserU'] != null
        ? new CreateUserU.fromJson(json['targetUserU'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['createUserUid'] = this.createUserUid;
    data['targetUserUid'] = this.targetUserUid;
    data['contents'] = this.contents;
    data['expirationDate'] = this.expirationDate;
    data['exp'] = this.exp;
    data['status'] = this.status;
    if (this.createUserU != null) {
      data['createUserU'] = this.createUserU!.toJson();
    }
    if (this.targetUserU != null) {
      data['targetUserU'] = this.targetUserU!.toJson();
    }
    return data;
  }
}

class CreateUserU {
  String? nickname;
  String? realname;

  CreateUserU({this.nickname, this.realname});

  CreateUserU.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    realname = json['realname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['realname'] = this.realname;
    return data;
  }
}