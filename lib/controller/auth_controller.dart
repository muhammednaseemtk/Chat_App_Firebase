import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { idle, loading, success, error }

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthStatus _status = AuthStatus.idle;
  String _errorMessage = '';
  bool _disposed = false;

  AuthStatus get status => _status;
  String get errorMessage => _errorMessage;

  Stream<List<UserModel>> get usersStream => _authService.getUsers();
  get currentUser => _authService.currentUser;

  Future<bool> login(String email, String password) async {
    _setStatus(AuthStatus.loading);
    try {
      await _authService.login(email: email, password: password);
      _setStatus(AuthStatus.success);
      return true;
    } catch (e) {
      _errorMessage = _parseError(e.toString());
      _setStatus(AuthStatus.error);
      return false;
    }
  }

  Future<bool> register(String email, String password, String confirm) async {
    if (password != confirm) {
      _errorMessage = 'Passwords do not match';
      _setStatus(AuthStatus.error);
      return false;
    }
    _setStatus(AuthStatus.loading);
    try {
      await _authService.register(email: email, password: password);
      _setStatus(AuthStatus.success);
      return true;
    } catch (e) {
      _errorMessage = _parseError(e.toString());
      _setStatus(AuthStatus.error);
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    if (!_disposed) _setStatus(AuthStatus.idle);
  }

  void resetStatus() {
    if (!_disposed) _setStatus(AuthStatus.idle);
  }

  void _setStatus(AuthStatus s) {
    if (_disposed) return;
    _status = s;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  String _parseError(String e) {
    if (e.contains('user-not-found')) return 'No user found with this email.';
    if (e.contains('wrong-password')) return 'Incorrect password.';
    if (e.contains('email-already-in-use')) return 'Email already in use.';
    if (e.contains('weak-password')) return 'Password is too weak.';
    if (e.contains('invalid-email')) return 'Invalid email address.';
    return 'Something went wrong. Try again.';
  }
}