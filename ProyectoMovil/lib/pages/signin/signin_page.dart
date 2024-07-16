import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/login/login_page.dart';
import 'signin_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  void _showTermsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Términos y Condiciones',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => control.aceptTerms(context),
                  child: Text('Acepto'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120.0, 35.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => control.declineTerms(context),
                  child: Text('No Acepto'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120.0, 35.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    required bool enabled,
    bool obscureText = false,
  }) {
    return TextField(
      enabled: enabled,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required bool enabled,
  }) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: enabled ? Color(0XFF31A062) : Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: Text(
          label,
          style: TextStyle(color: enabled ? Colors.white : Colors.black, fontSize: 14.0),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Stack(
      children: [
        Container(color: Color(0XFFF2F2F2)),
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                  ),
                ),
              ),
            ),
            Expanded(child: Text(''), flex: 1),
          ],
        ),
        // Form container with rounded corners
        Positioned(
          bottom: 30.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: isKeyboardOpen ? 40.0 : 60.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text('Crear Cuenta', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => _buildTextField(
                      labelText: 'DNI',
                      controller: control.dniController,
                      enabled: control.termsCheck.value,
                    )),
                    SizedBox(height: 10.0),
                    Obx(() => _buildTextField(
                      labelText: 'Correo',
                      controller: control.emailController,
                      enabled: control.termsCheck.value,
                    )),
                    SizedBox(height: 10.0),
                    Obx(() => _buildTextField(
                      labelText: 'Contraseña',
                      controller: control.pass1Controller,
                      enabled: control.termsCheck.value,
                      obscureText: true,
                    )),
                    SizedBox(height: 10.0),
                    Obx(() => _buildTextField(
                      labelText: 'Repita Contraseña',
                      controller: control.pass2Controller,
                      enabled: control.termsCheck.value,
                      obscureText: true,
                    )),
                    SizedBox(height: 10.0),
                    Obx(() => _buildButton(
                      label: 'Crear Cuenta',
                      onPressed: control.termsCheck.value ? () => control.createAccount() : () {},
                      enabled: control.termsCheck.value,
                    )),
                    SizedBox(height: 10.0),
                    Obx(() => GestureDetector(
                      onTap: () => _showTermsBottomSheet(context),
                      child: Row(
                        children: [
                          Checkbox(
                            value: control.termsCheck.value,
                            onChanged: (value) => _showTermsBottomSheet(context),
                          ),
                          Text('Acepto Términos y Condiciones'),
                        ],
                      ),
                    )),
                    Obx(() => Text(
                      control.message.value,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: control.messageColor.value,
                      ),
                    )),
                    _buildLinks(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinks(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 10.0),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    print('clicked Crear Cuenta');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Ingresar',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFF26F29),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Recuperar Contraseña',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFF26F29),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    control.getTerms();
    return MaterialApp(
      home: Scaffold(body: _buildBody(context)),
    );
  }
}
