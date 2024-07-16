import 'package:get/get.dart';

class SliderController extends GetxController {
  // Lista de imágenes
  final List<String> imagePaths = [
    'assets/images/slider.png',
    'assets/images/Invicta2.webp',
    'assets/images/Invicta1.webp',
    'assets/images/Invicta3.webp',
    'assets/images/Invicta4.jpeg',
  ];

  // Índice de la página actual
  var currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }
}
