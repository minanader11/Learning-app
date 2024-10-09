

import 'package:encrypt_shared_preferences/provider.dart';
import 'package:mario_app/core/shared_pref_enum.dart';

class SharedPRefHelper {
  var sharedPref = EncryptedSharedPreferences.getInstance();

  bool get isLight {
    try {
      return sharedPref.getBoolean(SharedPrefEnum.isLight.toString())!;
    } catch (e) {
      return true;
    }
  }
  String get getLanguage {
    try {
      return sharedPref.getString(SharedPrefEnum.language.toString())!;
    } catch (e) {
      return "ar";
    }
  }

  String get getBearerToken {
    try {
      return sharedPref.getString(SharedPrefEnum.bearerToken.toString())!;
    } catch (e) {
      return "";
    }
  }
  String get getIdToken {
    try {
      return sharedPref.getString(SharedPrefEnum.idToken.toString())!;
    } catch (e) {
      return "";
    }
  }
  int get getRequestRouteId {
    try {
      return sharedPref.getInt(SharedPrefEnum.requestRouteId.toString())!;
    } catch (e) {
      return 0;
    }
  }
  String get getId {
    try {
      return sharedPref.getString(SharedPrefEnum.id.toString())!;
    } catch (e) {
      return "";
    }
  }

  String get getUserName {
    try {
      return sharedPref.getString(SharedPrefEnum.userName.toString())!;
    } catch (e) {
      return "";
    }
  }
  String get getUserImage {
    try {
      return sharedPref.getString(SharedPrefEnum.userImage.toString())!;
    } catch (e) {
      return "";
    }
  }

  String get getAccessToken {
    try {
      return sharedPref.getString(SharedPrefEnum.accessToken.toString())!;
    } catch (e) {
      return "";
    }
  }


  String get getFireBaseToken {
    try {
      return sharedPref.getString(SharedPrefEnum.fireBaseToken.toString())!;
    } catch (e) {
      return "";
    }
  }

  void setDarkMode(bool value) {
    sharedPref.setBoolean(SharedPrefEnum.isLight.toString(), value);
  }

  void setLanguage(String value) {
    sharedPref.setString(SharedPrefEnum.language.toString(), value);
  }

  void setBearerToken(String value) {
    sharedPref.setString(SharedPrefEnum.bearerToken.toString(), value);
  }
  void setIdToken(String value) {
    sharedPref.setString(SharedPrefEnum.idToken.toString(), value);
  }
  void setRequestRouteId(int value) {
    sharedPref.setInt(SharedPrefEnum.requestRouteId.toString(), value);
  }
  void setId(String value) {
    sharedPref.setString(SharedPrefEnum.id.toString(), value);
  }
  void setUserName (String value) {
    sharedPref.setString(SharedPrefEnum.userName.toString(), value);
  }
  void setUserImage (String value) {
    sharedPref.setString(SharedPrefEnum.userImage.toString(), value);
  }

  void setAccessToken(String value) {
    sharedPref.setString(SharedPrefEnum.accessToken.toString(), value);
  }

  void setFirebaseToken(String value) {
    sharedPref.setString(SharedPrefEnum.fireBaseToken.toString(), value);
  }
}
