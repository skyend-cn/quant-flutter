// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
    close: (json['close'] as num)?.toDouble(),
    date: json['date'] as String,
    high: (json['high'] as num)?.toDouble(),
    low: (json['low'] as num)?.toDouble(),
    open: (json['open'] as num)?.toDouble(),
    symbol: json['symbol'] as String,
    uuid: json['uuid'] as String,
    volume: (json['volume'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'close': instance.close,
      'date': instance.date,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
      'symbol': instance.symbol,
      'uuid': instance.uuid,
      'volume': instance.volume,
    };
