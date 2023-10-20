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
}
