import 'package:shared_preferences/shared_preferences.dart';

addStringToPreference({required String key, required String value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

addIntToPreference({required String key, required int value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

addDoubleToPreference({required String key, required double value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

addBoolToPreference({required String key, bool? value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value ?? false);
}

addStringListToPreference(
    {required String key, required List<String> value}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

getStringValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString(key);
  return stringValue;
}

getBoolValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return bool
  bool? boolValue = prefs.getBool(key);
  return boolValue;
}

getIntValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return int
  int intValue = prefs.getInt(key) ?? 0;
  return intValue;
}

getDoubleValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double? doubleValue = prefs.getDouble(key);
  return doubleValue;
}

getStringListValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return List of String
  List<String>? stringListValue = prefs.getStringList(key) ?? [];
  return stringListValue;
}

removeValuesPreference({required String key}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

removeAllValuesPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

reloadPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.reload();
}
