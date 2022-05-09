import 'dart:convert';

import '../models/users/user_model.dart';
import 'CacheUtil.dart';

class AppCache {
  static bool? isOpenAppFirstTime() {
    return CacheUtil.get<bool>("first_time_open", true);
  }

  static void setOpenAppFirstTime(bool value) {
    CacheUtil.save("first_time_open", value);
  }

  static bool isUserLogin() {
    return CacheUtil.contains("user");
  }

  static void saveSubDomain(String subDomain) {
    CacheUtil.save("subDomain", subDomain);
  }

  static void saveUser(User user) {
    CacheUtil.save("user", user);
  }

  static void clearCache() {
    // publicUserData = null;
    CacheUtil.clearCache();
  }

  static void clearUserData() {
    CacheUtil.deleteAt('user');
  }

  static void clearSubDomain() {
    CacheUtil.deleteAt("subDomain");
  }

  static User? getUser() {
    final String userData = CacheUtil.get<String>("user", "");
    if (userData.trim().isNotEmpty) {
      final Map<String, dynamic> data =
          jsonDecode(userData) as Map<String, dynamic>;

      return User.fromJson(data);
      // return CurrentUserModel.fromCache(data);
    } else {
      return null;
      // return publicUserData;
    }
  }
}
