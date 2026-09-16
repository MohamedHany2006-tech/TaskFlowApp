import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/core/Utilis/constans.dart';


class CacheHelper {
  static late SharedPreferences sharedPre;

  static Future<void> init() async {
    sharedPre = await SharedPreferences.getInstance();
  }

  void setUserToken({required String userToken}) {
    sharedPre.setString(Constans.kUserToken, userToken);
  }

  String getUserToken() {
    return sharedPre.getString(Constans.kUserToken) ?? '';
  }
}