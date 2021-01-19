import 'package:dio/dio.dart';
import 'package:quant/utils/global.dart';
import 'package:quant/utils/logger.dart';

/// 初始化dio
Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://47.104.212.171",
  );

  Dio dio = Dio(_baseOptions);

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    if (G.user.data != null) {
      options.headers['Authorization'] = G.user.data.token;
    }
    Logger.v("[Request] url: " + options.baseUrl);
    Logger.v("[Request] path: " + options.path);
    Logger.v("[Request] headers: " + options.headers.toString());
    Logger.v("[Request] parameters: " + options.queryParameters.toString());
    return options;
  }, onResponse: (Response response) async {
    Logger.v("[Response]: " + response.toString());

    if (response.data['code'] != 200) {
      await G.toast(response.data['message']);
      response.data = null;
    }
    return response;
  }, onError: (DioError e) async {
    Logger.v("[DioError]: " + e.toString());
    return e;
  }));

  return dio;
}
