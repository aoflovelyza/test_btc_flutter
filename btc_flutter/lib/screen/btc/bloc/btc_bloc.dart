import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:btc_flutter/helper/api_response.dart';
import 'package:btc_flutter/helper/base_repository.dart';
import 'package:btc_flutter/helper/preferences_helper.dart';
import 'package:btc_flutter/model/current_price/current_price.dart';
import 'package:btc_flutter/repository/current_price_repository.dart';

part 'btc_event.dart';
part 'btc_state.dart';

class BtcBloc extends Bloc<BtcEvent, BtcState> {
  BtcBloc() : super(BtcInitial()) {
    on<GetdataCurrencyEvent>((event, emit) => _getCurrentPrice(event, emit));
  }

  _getCurrentPrice(GetdataCurrencyEvent event, Emitter<BtcState> emit) async {
    emit(BtcGetDataCurrencyLoaddingState());
    var response = await event.getCurrentPrice();
    response?.when(success: (data) async {
      emit(BtcGetDataCurrencyPassState(dataCurrency: data));
      if ((await getDataHistory() ?? '').isNotEmpty) {
        var dataHistoryJson = jsonDecode(await getDataHistory() ?? '');
        var dataHistoryList =
            HistoryCurrentPriceModel.fromJson(dataHistoryJson);
        List<CurrentPriceModel?>? listCurrentPrice = [];
        listCurrentPrice = dataHistoryList.historyCurrentPrice;
        listCurrentPrice?.add(data);
        await saveDataHistory(jsonEncode(
            HistoryCurrentPriceModel(historyCurrentPrice: listCurrentPrice)));
      } else {
        List<CurrentPriceModel?>? listCurrentPrice = [];
        listCurrentPrice.add(data);
        await saveDataHistory(jsonEncode(
            HistoryCurrentPriceModel(historyCurrentPrice: listCurrentPrice)));
      }
    }, failure: (error) {
      emit(BtcGetDataCurrencyFailState(massage: error ?? ''));
    }, error: (String? error) {
      emit(BtcGetDataCurrencyFailState(massage: error ?? ''));
    });
  }

  double convertBtx({required double? rate, required String? number}) {
    double? numberDounle = 0;
    numberDounle = ((number?.isEmpty ?? false) || number == ".")
        ? 0
        : double.parse(number ?? "0");
    return (numberDounle) / (rate ?? 0.0);
  }
}
