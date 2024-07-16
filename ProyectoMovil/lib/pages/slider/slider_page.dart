import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'slider_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SliderPage extends StatelessWidget {
  final SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 0), // Espacio superior opcional
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Ajusta el valor según tus necesidades
            border: Border.all(
              color: Colors.grey, // Color del borde
              width: 1, // Ancho del borde
            ),
          ),
          child: CarouselSlider.builder(
            itemCount: controller.imagePaths.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Ajusta el valor según tus necesidades
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Ajusta el valor según tus necesidades
                  child: Image.asset(controller.imagePaths[index], fit: BoxFit.cover),
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 1/2,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 10),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                controller.updatePage(index);
              },
            ),
          ),
        ),
        // Indicador de página
        Obx(() => DotsIndicator(
          dotsCount: controller.imagePaths.length,
          position: controller.currentPage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(8.0),
            activeSize: const Size(16.0, 8.0),
            color: Colors.grey,
            activeColor: Color(0XFF31A062),
            spacing: EdgeInsets.all(4),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        )),
      ],
    );
  }
}
