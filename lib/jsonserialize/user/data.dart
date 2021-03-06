import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class UserData {
  String token;
  String uuid;

  UserData({
    this.token,
    this.uuid,
  });

  //反序列化
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
