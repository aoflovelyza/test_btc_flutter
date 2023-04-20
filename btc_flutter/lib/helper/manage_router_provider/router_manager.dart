import 'package:btc_flutter/screen/btc/btc_screen.dart';
import 'package:btc_flutter/screen/history/history_screen.dart';
import 'package:btc_flutter/screen/list_menu/list_menu.dart';
import 'package:btc_flutter/screen/logical_test/logical_test_screen.dart';
import 'package:flutter/material.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ListMenuScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ListMenuScreen());
      case BtcScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BtcScreen());
      case HistoryScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HistoryScreen());
      case LogicalTestScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LogicalTestScreen());

      default:
        return MaterialPageRoute(builder: (_) => const ListMenuScreen());
    }
  }
}
