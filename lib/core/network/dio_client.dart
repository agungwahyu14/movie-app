import 'package:dio/dio.dart';
import '../../static/app_setting.dart';
import 'app_interceptor.dart';

class DioClient {
  final AppSetting appSetting;

  DioClient(this.appSetting);

  Dio get dio {
    final Dio dio = Dio();
    dio.options.baseUrl = appSetting.baseUrlPopular;
    dio.options.baseUrl = appSetting.baseUrlTopRated;
    dio.options.baseUrl = appSetting.baseUpcoming;
    dio.interceptors.add(AppInterceptor(appSetting.token));
    return dio;
  }
}
