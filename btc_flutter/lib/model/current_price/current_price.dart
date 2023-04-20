import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:btc_flutter/model/conver_to_string_model.dart';

part 'current_price.g.dart';

@JsonSerializable()
class CurrentPriceModel {
  @JsonKey(name: 'time')
  final Time? time;
  @JsonKey(name: 'disclaimer', fromJson: convertToString)
  final String? disclaimer;
  @JsonKey(name: 'chartName', fromJson: convertToString)
  final String? chartName;
  @JsonKey(name: 'bpi')
  final Bpi? bpi;

  CurrentPriceModel({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  factory CurrentPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPriceModelToJson(this);
}

@JsonSerializable()
class Time {
  @JsonKey(name: 'updated', fromJson: convertToString)
  final String? updated;
  @JsonKey(name: 'updatedISO', fromJson: convertToString)
  final String? updatedISO;
  @JsonKey(name: 'updateduk', fromJson: convertToString)
  final String? updateduk;

  Time({
    this.updated,
    this.updatedISO,
    this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
  Map<String, dynamic> toJson() => _$TimeToJson(this);
}

@JsonSerializable()
class Bpi {
  @JsonKey(name: 'USD')
  final USD? uSD;
  @JsonKey(name: 'GBP')
  final GBP? gBP;
  @JsonKey(name: 'EUR')
  final EUR? eUR;

  Bpi({
    this.uSD,
    this.gBP,
    this.eUR,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => _$BpiFromJson(json);
  Map<String, dynamic> toJson() => _$BpiToJson(this);
}

@JsonSerializable()
class USD {
  @JsonKey(name: 'code', fromJson: convertToString)
  final String? code;
  @JsonKey(name: 'symbol', fromJson: convertToString)
  final String? symbol;
  @JsonKey(name: 'rate', fromJson: convertToString)
  final String? rate;
  @JsonKey(name: 'description', fromJson: convertToString)
  final String? description;
  @JsonKey(name: 'rate_float')
  final double? rateFloat;

  USD({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory USD.fromJson(Map<String, dynamic> json) => _$USDFromJson(json);
  Map<String, dynamic> toJson() => _$USDToJson(this);
}

@JsonSerializable()
class GBP {
  @JsonKey(name: 'code', fromJson: convertToString)
  final String? code;
  @JsonKey(name: 'symbol', fromJson: convertToString)
  final String? symbol;
  @JsonKey(name: 'rate', fromJson: convertToString)
  final String? rate;
  @JsonKey(name: 'description', fromJson: convertToString)
  final String? description;
  @JsonKey(name: 'rate_float')
  final double? rateFloat;

  GBP({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory GBP.fromJson(Map<String, dynamic> json) => _$GBPFromJson(json);
  Map<String, dynamic> toJson() => _$GBPToJson(this);
}

@JsonSerializable()
class EUR {
  @JsonKey(name: 'code', fromJson: convertToString)
  final String? code;
  @JsonKey(name: 'symbol', fromJson: convertToString)
  final String? symbol;
  @JsonKey(name: 'rate', fromJson: convertToString)
  final String? rate;
  @JsonKey(name: 'description', fromJson: convertToString)
  final String? description;
  @JsonKey(name: 'rate_float')
  final double? rateFloat;

  EUR({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory EUR.fromJson(Map<String, dynamic> json) => _$EURFromJson(json);
  Map<String, dynamic> toJson() => _$EURToJson(this);
}

@JsonSerializable()
class HistoryCurrentPriceModel {
  final List<CurrentPriceModel?>? historyCurrentPrice;
  HistoryCurrentPriceModel({required this.historyCurrentPrice});

  factory HistoryCurrentPriceModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryCurrentPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryCurrentPriceModelToJson(this);

  HistoryCurrentPriceModel copyWith({
    List<CurrentPriceModel?>? historyCurrentPrice,
  }) {
    return HistoryCurrentPriceModel(
      historyCurrentPrice: historyCurrentPrice ?? this.historyCurrentPrice,
    );
  }
}
