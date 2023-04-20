import 'dart:convert';

import 'package:btc_flutter/helper/api_response.dart';
import 'package:btc_flutter/helper/base_repository.dart';
import 'package:btc_flutter/helper/dio_base_helper.dart';
import 'package:btc_flutter/helper/network_exception.dart';
import 'package:btc_flutter/model/current_price/current_price.dart';
import 'package:dio/dio.dart';

class CurrentPriceRepository {
  final DioBaseHelper _helper = DioBaseHelper();
  Dio? dio;

  final BaseRepository _baseRepository;
  CurrentPriceRepository(this._baseRepository);

  Future<ApiResponse<CurrentPriceModel?>?> getCurrentPrice() async {
    try {
      dio = await _helper.dioNoHeader();
      Response response = await dio!.get(_baseRepository.currentPrice);
      // print(response.data);
      var feature = CurrentPriceModel.fromJson(jsonDecode(response.data));
      return response.statusCode == 200
          ? ApiResponse.success(feature)
          : ApiResponse.failure(response.statusMessage);
    } catch (error) {
      return ApiResponse.error(NetworkExceptions.getErrorMessage(
          NetworkExceptions.getDioException(error)));
    }
  }
}
