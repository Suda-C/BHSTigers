import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyFirst = 'first';
  static const _keySecond = 'second';
  static const _keyThird = 'third';
  static const _keyFourth= 'fourth';
  static const _keyFifth = 'fifth';
  static const _keySeventh = 'sixth';
  static const _keyEighth= 'seventh';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setAll(String first, String second,String third,String fourth,String fifth,String seventh,String eighth) async {
    await _preferences?.setString(_keyFirst, first);
    await _preferences?.setString(_keySecond, second);
    await _preferences?.setString(_keyThird, third);
    await _preferences?.setString(_keyFourth, fourth);
    await _preferences?.setString(_keyFifth, fifth);
    await _preferences?.setString(_keySeventh, seventh);
    await _preferences?.setString(_keyEighth, eighth);
  }

  static String? getFirst() => _preferences?.getString(_keyFirst);
  static String? getSecond() => _preferences?.getString(_keySecond);
  static String? getThird() => _preferences?.getString(_keyThird);
  static String? getFourth() => _preferences?.getString(_keyFourth);
  static String? getFifth() => _preferences?.getString(_keyFifth);
  static String? getSeventh() => _preferences?.getString(_keySeventh);
  static String? getEighth() => _preferences?.getString(_keyEighth);

}