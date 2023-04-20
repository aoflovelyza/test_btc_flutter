part of 'btc_bloc.dart';

abstract class BtcState {}

class BtcInitial extends BtcState {}

class BtcGetDataCurrencyLoaddingState extends BtcState {}

class BtcGetDataCurrencyPassState extends BtcState {
  final CurrentPriceModel? dataCurrency;
  BtcGetDataCurrencyPassState({required this.dataCurrency});
}

class BtcGetDataCurrencyFailState extends BtcState {
  final String? massage;
  BtcGetDataCurrencyFailState({required this.massage});
}
