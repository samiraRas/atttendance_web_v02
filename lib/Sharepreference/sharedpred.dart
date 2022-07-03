import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferncesMethod {
  Future<void> sharedPreferenceSetDataForLogin(
      String name, String token, String cid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('token', token);
    await prefs.setString('cid', cid);
  }
}
