import 'package:duckduck/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users? _currentUser;
  String? _firebaseToken;
  String? _sessionId;

  Users? get currentUser => _currentUser;
  String? get firebaseToken => _firebaseToken;
  String? get sessionId => _sessionId;

  void setCurrentUser(Users user) {
    _currentUser = user;
    notifyListeners();
  }

  void setFirebaseToken(String token) {
    _firebaseToken = token;
    notifyListeners();
  }

  void setSessionId(String sessionId) {
    _sessionId = sessionId;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      // use firebase authentication to login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // set current user with the uid and email from firebase
      _currentUser = Users(
          uid: userCredential.user!.uid, email: userCredential.user!.email);
      // get firebase token
      _firebaseToken = await userCredential.user!.getIdToken();
      notifyListeners();
      return true;
    } catch (e) {
      // Handle the exception and display error to the user
      return false;
    }
  }

  Future<void> logout() async {
    // use firebase authentication to logout
    await _auth.signOut();
    _currentUser = null;
    _firebaseToken = null;
    _sessionId = null;
    notifyListeners();
  }

  Future<bool> register(
      String email, String password, String name, String deviceCode) async {
    try {
      // Check if the deviceCode is valid
      if (!_isValidDeviceCode(deviceCode)) {
        throw Exception("Invalid device code");
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user's profile with name
      await userCredential.user!.updateDisplayName(name);

      // Make a logic to store in mongoDB via Go Fiber

      _currentUser = Users(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email,
          name: name,
          deviceCode: deviceCode);
      _firebaseToken = await userCredential.user!.getIdToken();
      notifyListeners();

      return true;
    } catch (e) {
      // Handle the exception and display error to the user
      return false;
    }
  }

  bool _isValidDeviceCode(String deviceCode) {
    // Mocking 3 valid device codes
    List<String> validDeviceCodes = ['CODE123', 'CODE456', 'CODE789'];

    return validDeviceCodes.contains(deviceCode);
  }

  // get session from server

  Future<bool> getSessionFromServer() async {
    try {
      // Make an HTTP call to Go Fiber server sending firebaseToken
      // Get the session ID from the response
      // _sessionId = receivedSessionId;
      notifyListeners();
      return true;
    } catch (e) {
      // Handle errors
      return false;
    }
  }
}
