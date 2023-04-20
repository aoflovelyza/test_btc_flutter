import 'package:btc_flutter/screen/btc/btc_screen.dart';
import 'package:btc_flutter/screen/logical_test/logical_test_screen.dart';
import 'package:flutter/material.dart';

class ListMenuScreen extends StatefulWidget {
  const ListMenuScreen({super.key});

  static const String routeName = '/listMenu';

  @override
  State<ListMenuScreen> createState() => _ListMenuScreenState();
}

class _ListMenuScreenState extends State<ListMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'เมนู',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'เรทราคา BTC',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(BtcScreen.routeName);
            },
          ),
          GestureDetector(
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'LogicalTest',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(LogicalTestScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
