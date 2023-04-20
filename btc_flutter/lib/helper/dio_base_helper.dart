import 'package:btc_flutter/helper/base_repository.dart';
import 'package:dio/dio.dart';

class DioBaseHelper {
  final Dio dio = Dio();
  final BaseRepository baseRepository = BaseRepository.instance;

  Future<Dio> dioNoHeader() async {
    dio.interceptors.clear();

    dio.options = BaseOptions(
        baseUrl: baseRepository.baseUrl,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3));

    return dio;
  }
}
