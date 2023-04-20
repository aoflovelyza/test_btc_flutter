import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:btc_flutter/helper/preferences_helper.dart';
import 'package:btc_flutter/model/current_price/current_price.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    on<GetDataHistoryEvent>(
        (event, emit) => _getHistoryCurrentPrice(event, emit));
    on<DeleteDataHistoryEvent>(
        (event, emit) => _removeHistoryCurrentPrice(event, emit));
  }

  _getHistoryCurrentPrice(
      GetDataHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(GetdataHistoryLoaddingState());
    var dataHistoryString = await getDataHistory() ?? '';
    if (dataHistoryString.isEmpty) {
      emit(GetdataHistoryEmptyState(massage: "ไม่พบข้อมูล"));
    } else {
      var dataHistoryJson = jsonDecode(dataHistoryString);
      var dataHistoryList = HistoryCurrentPriceModel.fromJson(dataHistoryJson);
      emit(GetdataHistoryPassState(dataHistory: dataHistoryList));
    }
  }

  _removeHistoryCurrentPrice(
      DeleteDataHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(GetdataHistoryLoaddingState());
    await saveDataHistory("");
    emit(GetdataHistoryEmptyState(massage: "ไม่พบข้อมูล"));
  }
}
