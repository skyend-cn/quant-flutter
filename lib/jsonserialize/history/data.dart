import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class History {
  double close;
  String date;
  double high;
  double low;
  double open;
  String symbol;
  String uuid;
  double volume;

  History(
      {this.close,
      this.date,
      this.high,
      this.low,
      this.open,
      this.symbol,
      this.uuid,
      this.volume});

  //反序列化
  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
