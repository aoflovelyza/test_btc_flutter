import 'package:btc_flutter/screen/btc/bloc/btc_bloc.dart';
import 'package:btc_flutter/screen/history/bloc/history_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> blocProviderMuti = [
  BlocProvider<BtcBloc>(create: ((context) => BtcBloc())),
  BlocProvider<HistoryBloc>(create: ((context) => HistoryBloc())),
];
