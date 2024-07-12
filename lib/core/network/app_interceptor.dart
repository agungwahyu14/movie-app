import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final String token;

  AppInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['barrier-token'] = token;
    return super.onRequest(options, handler);
  }
}
