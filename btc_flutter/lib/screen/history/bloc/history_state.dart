part of 'history_bloc.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class GetdataHistoryLoaddingState extends HistoryState {}

class GetdataHistoryPassState extends HistoryState {
  final HistoryCurrentPriceModel? dataHistory;
  GetdataHistoryPassState({
    required this.dataHistory,
  });
}

class GetdataHistoryEmptyState extends HistoryState {
  final String? massage;
  GetdataHistoryEmptyState({required this.massage});
}
