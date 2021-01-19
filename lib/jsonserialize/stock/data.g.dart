// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) {
  return StockData(
    name: json['name'] as String,
    cnName: json['cnName'] as String,
    category: json['category'] as String,
    symbol: json['symbol'] as String,
    price: (json['price'] as num)?.toDouble(),
    diff: (json['diff'] as num)?.toDouble(),
    chg: (json['chg'] as num)?.toDouble(),
    close: (json['close'] as num)?.toDouble(),
    open: (json['open'] as num)?.toDouble(),
    high: (json['high'] as num)?.toDouble(),
    low: (json['low'] as num)?.toDouble(),
    amplitude: (json['amplitude'] as num)?.toDouble(),
    volume: (json['volume'] as num)?.toDouble(),
    marketCapitalization: (json['marketCapitalization'] as num)?.toDouble(),
    pe: (json['pe'] as num)?.toDouble(),
    market: json['market'] as String,
    fiftyTwoWeekHigh: (json['fiftyTwoWeekHigh'] as num)?.toDouble(),
    fiftyTwoWeekLow: (json['fiftyTwoWeekLow'] as num)?.toDouble(),
    averageVolume: (json['averageVolume'] as num)?.toDouble(),
    eps: (json['eps'] as num)?.toDouble(),
    holdersChangedNum: (json['holdersChangedNum'] as num)?.toDouble(),
    holdersChangedFund: (json['holdersChangedFund'] as num)?.toDouble(),
    lastTenDaysInsideChangeNum:
        (json['lastTenDaysInsideChangeNum'] as num)?.toDouble(),
    lastTenDaysInsideChangeFund:
        (json['lastTenDaysInsideChangeFund'] as num)?.toDouble(),
    bookValue: (json['bookValue'] as num)?.toDouble(),
    beta: (json['beta'] as num)?.toDouble(),
    peg: (json['peg'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'name': instance.name,
      'cnName': instance.cnName,
      'category': instance.category,
      'symbol': instance.symbol,
      'price': instance.price,
      'diff': instance.diff,
      'chg': instance.chg,
      'close': instance.close,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'amplitude': instance.amplitude,
      'volume': instance.volume,
      'marketCapitalization': instance.marketCapitalization,
      'pe': instance.pe,
      'market': instance.market,
      'fiftyTwoWeekHigh': instance.fiftyTwoWeekHigh,
      'fiftyTwoWeekLow': instance.fiftyTwoWeekLow,
      'averageVolume': instance.averageVolume,
      'eps': instance.eps,
      'holdersChangedNum': instance.holdersChangedNum,
      'holdersChangedFund': instance.holdersChangedFund,
      'lastTenDaysInsideChangeNum': instance.lastTenDaysInsideChangeNum,
      'lastTenDaysInsideChangeFund': instance.lastTenDaysInsideChangeFund,
      'bookValue': instance.bookValue,
      'beta': instance.beta,
      'peg': instance.peg,
    };
