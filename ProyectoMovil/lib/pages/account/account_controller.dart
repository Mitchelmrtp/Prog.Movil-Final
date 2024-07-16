import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timeapp/configs/constants.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeapp/pages/login/login_page.dart';

class AccountController extends GetxController {
  var nombre = ''.obs;
  var apellidos = ''.obs;
  var dni = ''.obs;
  var correo = ''.obs;
  var telefono = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  void fetchProfileData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? user = prefs.getString('user');
      
      final response = await http.get(Uri.parse('${BASE_URL}Perfiles/list?code=$user'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          nombre.value = data[0]['names'];
          apellidos.value = data[0]['last_names'];
          dni.value = data[0]['dni'];
          correo.value = data[0]['email'];
          telefono.value = data[0]['phone'];
        } else {
          print('No se encontraron datos para el perfil especificado');
        }
      } else {
        print('Error al cargar datos del perfil: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    await prefs.remove('token');
    Get.offAll(() => LoginPage());
  }
}
