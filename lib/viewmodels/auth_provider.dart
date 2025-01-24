import 'package:flutter/material.dart';
import 'package:notepad/models/user_model.dart';
import 'package:notepad/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  User? _user;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  User? get user => _user;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (username != null) {
      _user = User(username: username);
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    Map<String, dynamic>? loginResponse =
        await _authService.login(email, password);
    if (loginResponse != null && loginResponse['status'] == 200) {
      _user = User.fromJson(loginResponse['data']['user']);

      final token = loginResponse['data']['token'];
      final expiryInSeconds = loginResponse['data']['expires'];

      saveToken(token, expiryInSeconds);
      _isLoading = false;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _user!.username);
      return true;
    } else {
      _errorMessage = loginResponse?['message'] ??
          "Login failed. Please check your credentials.";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String email, String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    Map<String, dynamic>? response =
        await _authService.register(email, username, password);
    if (response != null && response['status'] == 200) {
      _user = User.fromJson(response['data']['user']);

      final token = response['data']['token'];
      final expiryInSeconds = response['data']['expires'];

      saveToken(token, expiryInSeconds);
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = response?['message'] ??
          "Register failed. Please check your credentials.";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> saveToken(String token, int expiryInSeconds) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryTime = DateTime.now().add(Duration(seconds: expiryInSeconds));
    await prefs.setString('accessToken', token);
    await prefs.setString('expiryTime', expiryTime.toIso8601String());
  }

  Future<bool> logout() async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic>? response = await _authService.logout();
    if (response != null && response['status'] == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      _user = null;
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = response?['message'] ?? "Logout failed";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
