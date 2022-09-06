import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  static LocalRepository? _instance;
  static SharedPreferences? _preferences;

  LocalRepository._internal();

  static Future<LocalRepository> get instance async {
    _instance ??= LocalRepository._internal();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  ///Set true after successful mobile verification
  Future<bool> setUserLoggedIn() async {
    return _preferences!.setBool(SharedPrefKeys.userLogin, true);
  }

  ///Set false on logout
  Future<bool> setUserLoggedOut() async {
    await _preferences!.clear();
    return await _preferences!.setBool(SharedPrefKeys.userLogin, false);
  }

  bool get isUserLoggedIn =>
      _preferences!.getBool(SharedPrefKeys.userLogin) ?? false;

  Future<bool> saveToken(String token) {
    return _preferences!.setString(SharedPrefKeys.token, token);
  }

  String getToken() {
    return _preferences!.getString(SharedPrefKeys.token) ?? '';
  }

  ///Clear all local DB
  ///Call this on logout
  Future<bool> clearDatabase() async {
    return await _preferences!.clear();
  }
}

/// Add keys which will be used in
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String themeMode = 'themeMode';
  static const String mobile = "userMobile";
  static const String user = 'user';
  static const String fcm = "userFCM";
  static const String userLogin = "FlierdUserLoggedIn";
  static const String userId = "userId";
  static const String token = "token";
}
