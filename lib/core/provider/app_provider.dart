import 'package:flutter/cupertino.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isDispose = false;
  bool _isLoading = false;
  String _errorMessage = '';
  String _snackBarMessage = '';

  bool get isDispose => _isDispose;
  bool get isLaoding => _isLoading;
  String get errorMessage => _errorMessage;
  String get snackBarMessage => _snackBarMessage;

  set errorMessage(String param) => _errorMessage = param;
  set snackBarMessage(String param) => _snackBarMessage = param;

  showLoading() {
    if (!_isDispose) {
      _isLoading = true;
      notifyListeners();
    }
  }

  hideLoading() {
    if (!_isDispose) {
      _isLoading = false;
      notifyListeners();
    }
  }

  init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}
