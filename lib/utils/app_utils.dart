import 'package:shared_preferences/shared_preferences.dart';

class AppUtils{
static  Future<String> getaccesstoken() async {
     final prefs =await SharedPreferences.getInstance();
      final getaccesstoken = prefs.getString("access");
      return getaccesstoken ?? "";
  }
}