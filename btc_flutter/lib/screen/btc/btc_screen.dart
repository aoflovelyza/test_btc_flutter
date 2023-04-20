import 'dart:async';

import 'package:btc_flutter/screen/btc/bloc/btc_bloc.dart';
import 'package:btc_flutter/screen/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BtcScreen extends StatefulWidget {
  const BtcScreen({super.key});

  static const String routeName = '/btcScreen';

  @override
  State<BtcScreen> createState() => _BtcScreenState();
}

class _BtcScreenState extends State<BtcScreen> {
  BtcBloc? btcBloc;
  final txtPrice = TextEditingController();

  @override
  void initState() {
    super.initState();
    btcBloc = BlocProvider.of<BtcBloc>(context);
    _fetData();
  }

  _fetData() async {
    btcBloc?.add(GetdataCurrencyEvent());
    startTimer();
  }

  Timer? _timer;

  void startTimer() {
    if (mounted) {
      _timer = Timer.periodic(
        const Duration(minutes: 1),
        (Timer timer) {
          _timer?.cancel();
          _fetData();
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    btcBloc?.isClosed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เรทราคา BTC"),
        centerTitle: true,
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
                TextField(
                  controller: txtPrice,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "กรอกจำนวน",
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                _listCurrency(context),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "ดูย้อนหลัง",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(HistoryScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCurrency(BuildContext context) {
    return BlocBuilder<BtcBloc, BtcState>(
      builder: (context, state) {
        if (state is BtcGetDataCurrencyPassState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _cardData(
                  title: state.dataCurrency?.bpi?.uSD?.description ?? "",
                  rate: state.dataCurrency?.bpi?.uSD?.rate ?? "",
                  convert:
                      "${btcBloc?.convertBtx(rate: state.dataCurrency?.bpi?.uSD?.rateFloat, number: txtPrice.text) ?? "0"}"),
              const SizedBox(
                height: 20,
              ),
              _cardData(
                  title: state.dataCurrency?.bpi?.gBP?.description ?? "",
                  rate: state.dataCurrency?.bpi?.gBP?.rate ?? "",
                  convert:
                      "${btcBloc?.convertBtx(rate: state.dataCurrency?.bpi?.gBP?.rateFloat, number: txtPrice.text) ?? "0"}"),
              const SizedBox(
                height: 20,
              ),
              _cardData(
                  title: state.dataCurrency?.bpi?.eUR?.description ?? "",
                  rate: state.dataCurrency?.bpi?.eUR?.rate ?? "",
                  convert:
                      "${btcBloc?.convertBtx(rate: state.dataCurrency?.bpi?.gBP?.rateFloat, number: txtPrice.text) ?? "0"}"),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _cardData(
      {required String? title,
      required String? rate,
      required String? convert}) {
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
                title ?? "",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Rate : ${rate ?? ""}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "convert : ${convert ?? ""}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
