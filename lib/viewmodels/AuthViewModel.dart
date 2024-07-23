import 'package:farm_control/repositories/AuthRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  User? _user;

  User? get user => _user;

  AuthViewModel() {
    _authRepository.user.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<User?> signIn(String email, String password) async {
    User? user = await _authRepository.signInWithEmailPassword(email, password);
    notifyListeners();
    return user;
  }

  Future<User?> signUp(String email, String password, String username, String phone) async {
    User? user = await _authRepository.signUpWithEmailAndPassword(email, password, username, phone);
    notifyListeners();
    return user;
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
