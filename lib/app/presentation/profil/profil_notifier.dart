import 'package:dewakoding_kasir/core/constant/constant.dart';
import 'package:dewakoding_kasir/core/helper/shared_preferences_helper.dart';
import 'package:dewakoding_kasir/core/provider/app_provider.dart';

class ProfilNotifier extends AppProvider {
  ProfilNotifier() {
    init();
  }

  bool _isLogout = false;
  String _name = '';
  String _email = '';

  bool get isLogout => _isLogout;
  String get name => _name;
  String get email => _email;

  @override
  init() async {
    await _getDetailUser();
  }

  _getDetailUser() async {
    showLoading();
    _name = await SharedPreferencesHelper.getString(PREF_NAME);
    _email = await SharedPreferencesHelper.getString(PREF_EMAIL);
    hideLoading();
  }

  logout() async {
    showLoading();
    await SharedPreferencesHelper.logout();
    _isLogout = true;
    hideLoading();
  }
}
