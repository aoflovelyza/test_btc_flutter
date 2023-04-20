part of 'history_bloc.dart';

abstract class HistoryEvent {}

class GetDataHistoryEvent extends HistoryEvent {}

class DeleteDataHistoryEvent extends HistoryEvent {}
