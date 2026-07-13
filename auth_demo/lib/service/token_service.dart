import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class TokenService {
  // Thuộc tính prefs = Lấy từ provider của SharedPreferenceProvider
  final SharedPreferences prefs;
  TokenService(this.prefs);

  // get() -> đọc jwt đã được lưu trong LS

  // save(User user) -> ghi jwt vào LS
  /*
  * Shared Preference (Local Storage)
  * "accessToken": "......"
  * "refreshToken": ".........."
  * */
  Future<void> save(User user) async {
    await prefs.setString('accessToken', user.accessToken);
    await prefs.setString('refreshToken', user.refreshToken);
  }

  // clear() -> xóa sạch
}