import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 用户管理相关
class ReqUser {
  final Dio _dio;

  ReqUser(this._dio);

  /// 使用uuid登录
  Future<Response> login({
    @required String uuid,
    @required String nonce,
    @required String md5,
  }) {
    return _dio.post('/loginByUUID',
        queryParameters: {"uuid": uuid, "nonce": nonce, "md5": md5});
  }

  ///意见反馈
  Future<Response> feedback(
      {@required String phone, @required String content}) {
    return _dio.post('/feedback',
        queryParameters: {'phone': phone, 'content': content});
  }
}
