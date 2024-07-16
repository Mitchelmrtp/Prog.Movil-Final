import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeapp/pages/login/login_page.dart';
import 'package:timeapp/pages/signin/signin_page.dart';
import '../home/home_page.dart';
import '../account/account_controller.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var message = "".obs;
  var messageColor = Colors.yellow.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');
    if (user != null) {
      Get.offAll(() => HomePage());
    }
  }

  Future<void> login(BuildContext context) async {
    String user = userController.text;
    String password = passwordController.text;

    // Realiza una solicitud POST al servidor Ruby
    var url = Uri.parse('http://192.168.18.35:4912/user/validate');
    var response = await http.post(url, body: {
      'user': user,
      'password': password,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Usuario encontrado
      message.value = 'usuario encontrado';
      messageColor.value = Colors.green;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', user);
      await prefs.setString('token', data['token']); // Assuming there's a token in the response

      Future.delayed(Duration(seconds: 1), () {
        message.value = '';
        // Elimina la instancia actual del AccountController para forzar una nueva creación
        Get.delete<AccountController>();
        Get.offAll(() => HomePage());
      });
    } else {
      // Usuario no encontrado
      message.value = 'usuario no encontrado';
      messageColor.value = Colors.red;
      Future.delayed(Duration(seconds: 1), () {
        message.value = '';
      });
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('token');
    Get.offAll(() => LoginPage());
  }

  void goResetPassword(BuildContext context) {
    print('nos vamos ResetPassword');
  }

  void goToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage()),
    );
  }
}
