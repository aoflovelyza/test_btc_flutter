import 'package:btc_flutter/helper/manage_router_provider/bloc_manage.dart';
import 'package:btc_flutter/helper/manage_router_provider/router_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/list_menu/list_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviderMuti,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Btc Flutter',
        onGenerateRoute: RouterManager.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListMenuScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? Container(),
          );
        },
      ),
    );
  }
}
