import 'package:duckduck/controller/http_handler.dart';
import 'package:duckduck/models/users.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthenticationProvider with ChangeNotifier {
  Users? _currentUser;
  String? _token;

  Users? get currentUser => _currentUser;
  String? get token => _token;

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
    _currentUser = null;
    _token = null;
    notifyListeners();
  }

  bool _isValidDeviceCode(String deviceCode) {
    // Consider updating this logic to fetch device codes from the server
    List<String> validDeviceCodes = ['CODE123', 'CODE456', 'CODE789'];

    return validDeviceCodes.contains(deviceCode);
  }

  // String handleDioException(DioException e) {
  //   if (e.response != null) {
  //     return e.response!.data["message"] ?? "An unknown error occurred";
  //   } else {
  //     return e.message;
  //   }
  // }
}
