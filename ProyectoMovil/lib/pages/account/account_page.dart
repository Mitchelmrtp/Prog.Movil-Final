import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeapp/pages/account/account_controller.dart';

class AccountPage extends StatelessWidget {
  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.teal[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            _buildProfileAvatar(),
            SizedBox(height: 24),
            Text(
              'Aquí encontrarás tus datos personales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 24),
            Obx(() => _buildProfileItem(Icons.person, 'Nombres', controller.nombre.value)),
            Obx(() => _buildProfileItem(Icons.person, 'Apellidos', controller.apellidos.value)),
            Obx(() => _buildProfileItem(Icons.credit_card, 'DNI', controller.dni.value)),
            Obx(() => _buildProfileItem(Icons.email, 'Correo Electrónico', controller.correo.value)),
            Obx(() => _buildProfileItem(Icons.phone, 'Teléfono', controller.telefono.value)),
            SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Cerrar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: Icon(
        Icons.person,
        size: 60,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.teal[800],
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            title + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
