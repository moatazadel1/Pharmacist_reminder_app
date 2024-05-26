import 'package:dio/dio.dart';
import 'package:reminder_app/core/api/end_points.dart';
import 'package:reminder_app/cache/cache_helper.dart';
import 'package:reminder_app/service/service_Locator.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        getIt<CacheHelper>().getData(key: ApiKey.token);

        //  CacheHelper().getData(key: ApiKey.token) != null
        //     ? CacheHelper().getData(key: ApiKey.token)
        //     : null;
    super.onRequest(options, handler);
  }
}
