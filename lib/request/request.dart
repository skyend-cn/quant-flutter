import 'package:dio/dio.dart';
import 'package:quant/request/init_dio.dart';
import 'package:quant/request/req_stock.dart';
import 'package:quant/request/req_user.dart';

class Request {
  Dio _dio;

  Request() {
    _dio = initDio();
  }

  ReqUser get user => ReqUser(_dio);

  ReqStock get stock => ReqStock(_dio);

}