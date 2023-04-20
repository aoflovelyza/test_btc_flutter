import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

@freezed
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success(T? data) = Success<T>;
  const factory ApiResponse.failure(String? message) = Failure<T>;
  const factory ApiResponse.error(String? error) = Error<T>;
}
