class UserProfileModel {
  String? uid;
  String? nickname;
  String? realname;
  String? signupDate;
  String? profileUid;
  num? exp;

  UserProfileModel({
    this.uid,
    this.nickname,
    this.realname,
    this.signupDate,
    this.profileUid,
    this.exp
  });

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nickname = json['nickname'];
    realname = json['realname'];
    signupDate = json['signupDate'];
    profileUid = json['profileUid'];
    exp = int.parse(json['exp']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['nickname'] = nickname;
    data['realname'] = realname;
    data['signupDate'] = signupDate;
    data['profileUid'] = profileUid;
    data['exp'] = exp;
    return data;
  }
}