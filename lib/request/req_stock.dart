import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 股票数据相关
class ReqStock {
  final Dio _dio;

  ReqStock(this._dio);

  /// 量化指标
  Future<Response> quant({@required String label}) {
    return _dio.post('/quant/$label');
  }

  ///k线历史
  Future<Response> history({@required String symbol}) {
    return _dio.post('/history/getHistoryBySymbol',
        queryParameters: {'symbol': symbol});
  }
}
