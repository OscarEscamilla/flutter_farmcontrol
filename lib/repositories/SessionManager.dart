import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();
  SharedPreferences? _prefs;


  // Private constructor
  SessionManager._internal();

  // Factory constructor to return the same instance
  factory SessionManager() {
    return _instance;
  }

  // Initialize the SharedPreferences instance
  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (error) {
      // Handle any errors here
      print('Error initializing SharedPreferences: $error');
    }
  }

  // Method to set a string value
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Method to get a string value
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  // Method to set a boolean value
  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // Method to get a boolean value
  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  // Method to remove a value
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Method to clear all values
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
