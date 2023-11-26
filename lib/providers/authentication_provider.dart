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

  AuthenticationProvider({String? initialToken}) {
    _token = initialToken;
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

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    if (_token != null) {
      Caller.setToken(_token!);
      await fetchUserDetails();
    }
  }

  Future<void> fetchUserDetails() async {
    try {
      Response response = await Caller.dio.get('/users',
          options: Options(headers: {'Authorization': 'Bearer $_token'}));
      if (response.statusCode == 200 && response.data != null) {
        print(response.data["data"]);
        _currentUser = Users.fromJson(response.data["data"]);
      } else {
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

  Future<bool> updateUserProfile(String name, String avatarUrl) async {
    try {
      Response response = await Caller.dio.post(
        '/users',
        data: {'name': name, 'avatar_url': avatarUrl},
        options: Options(headers: {'Authorization': 'Bearer $_token'}),
      );
      if (response.statusCode == 200) {
        // Update the current user's details
        _currentUser = Users.fromJson(response.data["data"]);
        notifyListeners();
        return true;
      }
      return false;
    } on DioException catch (e) {
      print(e.response!.data);
      return false;
    }
  }
}
