// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentPriceModel _$CurrentPriceModelFromJson(Map<String, dynamic> json) =>
    CurrentPriceModel(
      time: json['time'] == null
          ? null
          : Time.fromJson(json['time'] as Map<String, dynamic>),
      disclaimer: convertToString(json['disclaimer']),
      chartName: convertToString(json['chartName']),
      bpi: json['bpi'] == null
          ? null
          : Bpi.fromJson(json['bpi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentPriceModelToJson(CurrentPriceModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'disclaimer': instance.disclaimer,
      'chartName': instance.chartName,
      'bpi': instance.bpi,
    };

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      updated: convertToString(json['updated']),
      updatedISO: convertToString(json['updatedISO']),
      updateduk: convertToString(json['updateduk']),
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'updated': instance.updated,
      'updatedISO': instance.updatedISO,
      'updateduk': instance.updateduk,
    };

Bpi _$BpiFromJson(Map<String, dynamic> json) => Bpi(
      uSD: json['USD'] == null
          ? null
          : USD.fromJson(json['USD'] as Map<String, dynamic>),
      gBP: json['GBP'] == null
          ? null
          : GBP.fromJson(json['GBP'] as Map<String, dynamic>),
      eUR: json['EUR'] == null
          ? null
          : EUR.fromJson(json['EUR'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BpiToJson(Bpi instance) => <String, dynamic>{
      'USD': instance.uSD,
      'GBP': instance.gBP,
      'EUR': instance.eUR,
    };

USD _$USDFromJson(Map<String, dynamic> json) => USD(
      code: convertToString(json['code']),
      symbol: convertToString(json['symbol']),
      rate: convertToString(json['rate']),
      description: convertToString(json['description']),
      rateFloat: (json['rate_float'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$USDToJson(USD instance) => <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'rate': instance.rate,
      'description': instance.description,
      'rate_float': instance.rateFloat,
    };

GBP _$GBPFromJson(Map<String, dynamic> json) => GBP(
      code: convertToString(json['code']),
      symbol: convertToString(json['symbol']),
      rate: convertToString(json['rate']),
      description: convertToString(json['description']),
      rateFloat: (json['rate_float'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GBPToJson(GBP instance) => <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'rate': instance.rate,
      'description': instance.description,
      'rate_float': instance.rateFloat,
    };

EUR _$EURFromJson(Map<String, dynamic> json) => EUR(
      code: convertToString(json['code']),
      symbol: convertToString(json['symbol']),
      rate: convertToString(json['rate']),
      description: convertToString(json['description']),
      rateFloat: (json['rate_float'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EURToJson(EUR instance) => <String, dynamic>{
      'code': instance.code,
      'symbol': instance.symbol,
      'rate': instance.rate,
      'description': instance.description,
      'rate_float': instance.rateFloat,
    };

HistoryCurrentPriceModel _$HistoryCurrentPriceModelFromJson(
        Map<String, dynamic> json) =>
    HistoryCurrentPriceModel(
      historyCurrentPrice: (json['historyCurrentPrice'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CurrentPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryCurrentPriceModelToJson(
        HistoryCurrentPriceModel instance) =>
    <String, dynamic>{
      'historyCurrentPrice': instance.historyCurrentPrice,
    };
