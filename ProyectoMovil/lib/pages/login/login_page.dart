import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './login_controller.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginController control = Get.put(LoginController());

  Future<void> checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('user');
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLoginStatus(context);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return SafeArea(
        child: Stack(
      children: [
        Container(
          color: Color.fromARGB(255, 255, 255, 255),
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(0.0),
          alignment: Alignment.centerLeft,
        ),
        Column(
          children: [
            Expanded(
              flex: 2,
              child: _image(context),
            ),
            Expanded(flex: 1, child: Text('')),
          ],
        ),
        _form(context, isKeyboardOpen),
      ],
    ));
  }

  Widget _image(context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.0,
        MediaQuery.of(context).size.width * (isKeyboardOpen ? 0.0001 : 0.1),
        MediaQuery.of(context).size.width * 0.0,
        MediaQuery.of(context).size.width * 0.8,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
        ),
      ),
      child: null,
    );
  }

  Widget _form(BuildContext context, bool isKeyboardOpen) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255),
            width: 0.0,
          ),
          color: Color.fromARGB(255, 251, 251, 253),
        ),
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.width * (isKeyboardOpen ? 0.4 : 0.6),
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.width * 0.1,
        ),
        constraints: BoxConstraints(
          minHeight: 320,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido al mundo del tiempo!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  controller: control.userController,
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  controller: control.passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Obx(() => control.message.value == ''
                    ? SizedBox(height: 20)
                    : Column(
                        children: [
                          Text(
                            control.message.value,
                            style: TextStyle(
                              color: control.messageColor.value,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      )),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      control.login(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0XFF31A062),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      control.goToSignIn(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0XFF31A062),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Crea tu cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
