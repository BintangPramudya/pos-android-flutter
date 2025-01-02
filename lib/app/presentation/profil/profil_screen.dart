import 'package:bintang_kasir/app/presentation/login/login_screen.dart';
import 'package:bintang_kasir/app/presentation/product/product_screen.dart';
import 'package:bintang_kasir/app/presentation/profil/profil_notifier.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends AppWidget<ProfilNotifier, void, void> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: const Text(
        'Profil',
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _headerLayout(context),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalHelper.getColorScheme(context).primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _onPressProduct(context),
                child: const Text(
                  'Produk',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _onPressLogout(),
                child: const Text(
                  'Keluar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  checkVariable(BuildContext context) {
    if (notifier.isLogout) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  _headerLayout(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundColor: GlobalHelper.getColorScheme(context).primary,
          child: Text(
            notifier.name.substring(0, 1),
            style: GlobalHelper.getTextTheme(context,
                    appTextStyle: AppTextStyle.DISPLAY_MEDIUM)
                ?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          notifier.name,
          style: GlobalHelper.getTextTheme(context,
                  appTextStyle: AppTextStyle.TITLE_LARGE)
              ?.copyWith(
                  color: GlobalHelper.getColorScheme(context).primary,
                  fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          notifier.email,
          style: GlobalHelper.getTextTheme(context,
                  appTextStyle: AppTextStyle.BODY_SMALL)
              ?.copyWith(color: GlobalHelper.getColorScheme(context).secondary),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _onPressProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(),
      ),
    );
  }

  _onPressLogout() {
    notifier.logout();
  }
}
