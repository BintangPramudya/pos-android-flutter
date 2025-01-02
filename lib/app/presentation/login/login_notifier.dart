import 'package:dewakoding_kasir/app/domain/entity/auth.dart';
import 'package:dewakoding_kasir/app/domain/usecase/auth_login.dart';
import 'package:dewakoding_kasir/core/constant/constant.dart';
import 'package:dewakoding_kasir/core/helper/shared_preferences_helper.dart';
import 'package:dewakoding_kasir/core/provider/app_provider.dart';
import 'package:flutter/material.dart';

class LoginNotifier extends AppProvider {
  final AuthLoginUseCase _authLoginUseCase;
  LoginNotifier(this._authLoginUseCase) {
    init();
  }

  bool _isLogged = false;

  TextEditingController _baseUrlController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool get isLogged => _isLogged;
  TextEditingController get baseUrlController => _baseUrlController;
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  @override
  init() async {
    await _getBaseUrl();
    await _checkAuth();
  }

  _getBaseUrl() async {
    showLoading();
    final baseUrlPref = await SharedPreferencesHelper.getString(PREF_BASE_URL);
    if (baseUrlPref == null) {
      _baseUrlController.text = 'https://kasir.dewakoding.com';
      await SharedPreferencesHelper.setString(
          PREF_BASE_URL, _baseUrlController.text);
    } else {
      _baseUrlController.text = baseUrlPref;
    }
    hideLoading();
  }

  _checkAuth() async {
    final auth = await SharedPreferencesHelper.getString(PREF_AUTH);
    if (auth != null) {
      _isLogged = true;
    }
  }

  saveBaseUrl() {
    SharedPreferencesHelper.setString(PREF_BASE_URL, _baseUrlController.text);
  }

  login() async {
    showLoading();
    final response = await _authLoginUseCase(
        param: AuthEntity(
            email: _emailController.text, password: _passwordController.text));
    if (response.success) {
    } else {
      snackBarMessage = response.message;
    }
    _checkAuth();
    hideLoading();
  }
}
