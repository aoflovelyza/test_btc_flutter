import 'package:btc_flutter/model/current_price/current_price.dart';
import 'package:btc_flutter/screen/btc/bloc/btc_bloc.dart';
import 'package:btc_flutter/screen/history/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  static const String routeName = '/historyScreen';

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryBloc? historyBloc;
  BtcBloc? btcBloc;

  @override
  void initState() {
    super.initState();
    historyBloc = BlocProvider.of<HistoryBloc>(context);
    btcBloc = BlocProvider.of<BtcBloc>(context);
    _fetData();
    btcBloc?.isClosed;
  }

  @override
  void dispose() {
    super.dispose();
  }

  _fetData() async {
    historyBloc?.add(GetDataHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ประวัติเรทราคา BTC"),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 20,
            icon: const Icon(Icons.cleaning_services_outlined),
            onPressed: () {
              historyBloc?.add(DeleteDataHistoryEvent());
            },
          )
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => Future.sync(() => _fetData()),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                _listHistoryCurrency(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listHistoryCurrency(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is GetdataHistoryPassState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(),
            itemCount: state.dataHistory?.historyCurrentPrice?.length ?? 0,
            itemBuilder: ((context, index) {
              return _cardHistory(
                  state.dataHistory?.historyCurrentPrice?[index]);
            }),
          );
        } else if (state is GetdataHistoryEmptyState) {
          return Text(
            state.massage ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _cardHistory(CurrentPriceModel? historyCurrentPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Update : ${(historyCurrentPrice?.time?.updated ?? "")}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${historyCurrentPrice?.bpi?.uSD?.description ?? ""} Rate : ${historyCurrentPrice?.bpi?.uSD?.rate ?? ""}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${historyCurrentPrice?.bpi?.gBP?.description ?? ""} Rate : ${historyCurrentPrice?.bpi?.gBP?.rate ?? ""}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${historyCurrentPrice?.bpi?.eUR?.description ?? ""} Rate : ${historyCurrentPrice?.bpi?.eUR?.rate ?? ""}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
