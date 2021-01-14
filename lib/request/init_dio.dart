import 'package:dio/dio.dart';
import 'package:quant/utils/global.dart';

/// 初始化dio
Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: "http://47.104.212.171",
  );

  Dio dio = Dio(_baseOptions);

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest:(RequestOptions options) async {
        if(G.user.data != null) {
          options.headers['Authorization'] = G.user.data.token;
        }
        return options;
      },
      onResponse:(Response response) async {
        if(!response.data['success']) {
          await G.toast(response.data['message']);
          response.data = null;
        }
        return response;
      },
      onError: (DioError e) async {
        return e;
      }
    )
  );

  return dio;
}
