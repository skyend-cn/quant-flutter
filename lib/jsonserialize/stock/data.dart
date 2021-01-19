import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class StockData {
  ///股票名称
  String name;

  ///股票中文名称
  String cnName;

  ///所属行业
  String category;

  ///股票代码
  String symbol;

  ///股票当前价格
  double price;

  ///当前涨跌额
  double diff;

  ///当前涨跌幅
  double chg;

  ///上个交易日收盘价
  double close;

  ///开盘价
  double open;

  ///当日最高
  double high;

  ///当日最低
  double low;

  ///振幅
  double amplitude;

  ///成交量
  double volume;

  ///市值
  double marketCapitalization;

  ///市盈率
  double pe;

  ///证券市场
  String market;

//    /**
//     * 行业id
//     */
//     Long categoryId;

  ///52周最高
  double fiftyTwoWeekHigh;

  ///52周最低
  double fiftyTwoWeekLow;

  ///平均交易量
  double averageVolume;

  ///每股收益
  double eps;

  ///机构持有变动量
  double holdersChangedNum;

  ///机构持有变动金额
  double holdersChangedFund;

  ///近10天内部人员持有变动量
  double lastTenDaysInsideChangeNum;

  ///近10天内部人员持有变动金额
  double lastTenDaysInsideChangeFund;

  ///每股净资产
  double bookValue;

  double beta;

  double peg;

  StockData(
      {this.name,
      this.cnName,
      this.category,
      this.symbol,
      this.price,
      this.diff,
      this.chg,
      this.close,
      this.open,
      this.high,
      this.low,
      this.amplitude,
      this.volume,
      this.marketCapitalization,
      this.pe,
      this.market,
      this.fiftyTwoWeekHigh,
      this.fiftyTwoWeekLow,
      this.averageVolume,
      this.eps,
      this.holdersChangedNum,
      this.holdersChangedFund,
      this.lastTenDaysInsideChangeNum,
      this.lastTenDaysInsideChangeFund,
      this.bookValue,
      this.beta,
      this.peg});

  //反序列化
  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$StockDataToJson(this);
}
