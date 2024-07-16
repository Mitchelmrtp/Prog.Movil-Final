import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/login/login_page.dart';
import 'signin_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  void _showTermsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Términos y Condiciones',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => control.aceptTerms(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 35),
                    ),
                    child: Text('Acepto'),
                  ),
                  ElevatedButton(
                    onPressed: () => control.declineTerms(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 35),
                    ),
                    child: Text('No Acepto'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: enabled ? Color(0XFF31A062) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: enabled ? Colors.white : Colors.black,
            fontSize: 14,
          ),
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
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(child: Text(''), flex: 1),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0XFF999999), width: 2.0),
              color: Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.width * (isKeyboardOpen ? 0.4 : 0.6),
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.width * 0.1,
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text('Crear Cuenta', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => _buildTextField(
                          labelText: 'DNI',
                          controller: control.dniController,
                          enabled: control.termsCheck.value,
                        )),
                    Obx(() => _buildTextField(
                          labelText: 'Correo',
                          controller: control.emailController,
                          enabled: control.termsCheck.value,
                        )),
                    SizedBox(height: 6),
                    Obx(() => _buildTextField(
                          labelText: 'Contraseña',
                          controller: control.pass1Controller,
                          enabled: control.termsCheck.value,
                          obscureText: true,
                        )),
                    Obx(() => _buildTextField(
                          labelText: 'Repita Contraseña',
                          controller: control.pass2Controller,
                          enabled: control.termsCheck.value,
                          obscureText: true,
                        )),
                    Obx(() => _buildButton(
                          label: 'Crear Cuenta',
                          onPressed: control.termsCheck.value
                              ? () => control.createAccount()
                              : () {},
                          enabled: control.termsCheck.value,
                        )),
                    Obx(() => GestureDetector(
                          onTap: () => _showTermsBottomSheet(context),
                          child: Row(
                            children: [
                              Checkbox(
                                value: control.termsCheck.value,
                                onChanged: (value) =>
                                    _showTermsBottomSheet(context),
                              ),
                              Text('Acepto Términos y Condiciones'),
                            ],
                          ),
                        )),
                    Obx(() => Text(
                          control.message.value,
                          style: TextStyle(
                            fontSize: 12,
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
          SizedBox(height: 10),
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
                      fontSize: 12,
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
                      fontSize: 12,
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
