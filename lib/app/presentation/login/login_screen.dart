import 'package:bintang_kasir/app/presentation/home/home_screen.dart';
import 'package:bintang_kasir/app/presentation/login/login_notifier.dart';
import 'package:bintang_kasir/core/helper/dialog_helper.dart';
import 'package:bintang_kasir/core/helper/global_helper.dart';
import 'package:bintang_kasir/core/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // URL button at the top-right corner
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => _onPressUrlButton(context),
                icon: Icon(Icons.link, color: Colors.redAccent),
              ),
            ),
            // Illustration using an Icon
            Expanded(
              flex: 2,
              child: Icon(
                Icons.login_rounded,
                size: 120,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 16),
            // Welcome text
            Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            // Email/Username input
            TextField(
              controller: notifier.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Password input
            TextField(
              controller: notifier.passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                labelStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 24),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _onPressLogin(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Masuk',
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
    if (notifier.isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
    return super.checkVariable(context);
  }

  _onPressLogin(BuildContext context) {
    notifier.login();
  }

  _onPressUrlButton(BuildContext context) {
    DialogHelper.showBottomSheetDialog(
      context: context,
      title: 'Pengaturan Base URL',
      content: Column(
        children: [
          TextField(
            controller: notifier.baseUrlController,
            decoration: InputDecoration(
              labelText: 'Base URL',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _onPressSaveBaseUrl(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Simpan', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  _onPressSaveBaseUrl(BuildContext context) {
    notifier.saveBaseUrl();
    Navigator.pop(context);
  }
}
