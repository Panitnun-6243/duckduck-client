import 'package:duckduck/controller/http_handler.dart';
import 'package:duckduck/models/users.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider with ChangeNotifier {
  Users? _currentUser;
  String? _token;

  Users? get currentUser => _currentUser;
  String? get token => _token;

  AuthenticationProvider() {
    _init();
  }

  Future<void> _init() async {
    await _loadToken();
  }

  void setCurrentUser(Users user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      Response response = await Caller.dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        _currentUser = Users.fromJson(response.data["data"]);
        _token = response.data["data"]["token"];
        await _saveToken(_token!);
        Caller.setToken(_token!);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e.response!.data);
      return false;
    }
  }

  Future<bool> register(
      String email, String password, String name, String deviceCode) async {
    try {
      Response response = await Caller.dio.post(
        '/register',
        data: {
          'email': email,
          'password': password,
          'name': name,
          'device_code': deviceCode,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      print(e.response!.data);
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    _currentUser = null;
    _token = null;
    notifyListeners();
  }

  bool _isValidDeviceCode(String deviceCode) {
    // Consider updating this logic to fetch device codes from the server
    List<String> validDeviceCodes = ['CODE123', 'CODE456', 'CODE789'];

    return validDeviceCodes.contains(deviceCode);
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    if (_token != null) {
      print(_token);
      Caller.setToken(_token!);
      await fetchUserDetails(); // Implement this method to set _currentUser based on token
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      Response response = await Caller.dio.get('/users');
      if (response.statusCode == 200 && response.data != null) {
        print(Users.fromJson(response.data["data"]));
        _currentUser = Users.fromJson(response.data["data"]);
      } else {
        // Handle cases where the token might be invalid or expired
        _token = null;
        _currentUser = null;
      }
    } on DioException catch (e) {
      // Handle exception
      _token = null;
      _currentUser = null;
      print('Error fetching user details: ${e.message}');
    } finally {
      notifyListeners();
    }
  }
}
