import 'package:shared_preferences/shared_preferences.dart';

const String dataSave = "dataSave";

/// save Data Favourites
saveDataHistory(String dataSet) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(dataSave, dataSet);
}

/// get Data Countries And Team
Future<String?> getDataHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(dataSave) ?? '';
}
